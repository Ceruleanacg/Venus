//
//  FDNetworkEngine.m
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDNetworkEngine.h"

static FDNetworkEngine *_engine;

@implementation FDNetworkEngine {
    
    NSString *_hostName;
    NSString *_apiVersion;
    
    NSURL *_baseURL;
    
    NSDictionary *_apiDic;
    NSDictionary *_modelMap;
    
    AFHTTPRequestSerializer *_httpRequestSerializer;
    AFJSONRequestSerializer *_jsonRequestSerializer;
    
}

@synthesize token = _token;

+ (instancetype)sharedEngine {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _engine = [self new];
    });
    
    return _engine;
}

- (instancetype)init {
    if (self = [super init]) {
        NSString *apiConfigPath = [[NSBundle mainBundle] pathForResource:@"api" ofType:@"plist"];
        
        NSDictionary *apiConfigDic = [NSDictionary dictionaryWithContentsOfFile:apiConfigPath];
        
        _apiDic = [apiConfigDic copy];
        
        if (!_apiDic) {
            NSAssert(NO, @"API配置读取失败");
        }
        
#ifdef DEBUG
        _hostName   = _apiDic[@"DEBUG_HOST"];
#else
        _hostName   = _apiDic[@"RELEASE_HOST"];
#endif
        _modelMap   = _apiDic[@"MODEL_MAP"];
        _apiVersion = _apiDic[@"API_VERSION"];
        
        _baseURL    = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/%@", _hostName, _apiVersion]];
        
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        _jsonRequestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (void)addSessionTaskWithAPI:(NSString *)api Method:(NSString *)method Parms:(NSDictionary *)parms Callback:(FDRequestCallback)callback {
    
    BOOL isReachable = [self networkReachable];
    
    if (!isReachable) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *innerParms = [parms mutableCopy];
    
    innerParms[@"token"] = self.token;
    
    NSString *urlString = [[_baseURL URLByAppendingPathComponent:api] absoluteString];
    
    WeakSelf;
    
    void (^successBlock)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject) {
        
        StrongSelf;
        
        [s_self successActionWithTask:task ResponseObject:responseObject Callback:callback];
        
    };
    
    void (^failureBlock)(NSURLSessionDataTask *task, NSError *error) = ^(NSURLSessionDataTask *task, NSError *error) {
        
        StrongSelf;
        
        [s_self failureActionWithAPI:api Task:task Error:error Callback:callback];
    };
    
    if ([method isEqualToString:@"GET"]) {
        [manager setRequestSerializer:_httpRequestSerializer];
        [manager GET:urlString parameters:[innerParms copy] success:successBlock failure:failureBlock];
    } else if ([method isEqualToString:@"POST"]) {
        [manager setRequestSerializer:_jsonRequestSerializer];
        [manager POST:urlString parameters:[innerParms copy] success:successBlock failure:failureBlock];
    } else if ([method isEqualToString:@"DELETE"]) {
        [manager setRequestSerializer:_jsonRequestSerializer];
        [manager DELETE:urlString parameters:[innerParms copy] success:successBlock failure:failureBlock];
    } else {
        NSAssert(NO, @"Unknown method for api currently!");
    }
}

- (void)successActionWithTask:(NSURLSessionDataTask *)task ResponseObject:(id)responseObject Callback:(FDRequestCallback)callback {
    
    NSDictionary *responseDic = [responseObject copy];
    
    FDStatus status = [responseDic[@"code"] integerValue];
    
    NSString *message = [responseDic[@"msg"] copy];
    
    NSError *error = nil;
    
    if (status == FDStatusError) {
        error = [NSError errorWithDomain:message code:status userInfo:nil];
    }
    
    if (callback) {
        callback(error ? nil : responseDic, error);
    }
}

- (void)failureActionWithAPI:(NSString *)api Task:(NSURLSessionDataTask *)task Error:(NSError *)error Callback:(FDRequestCallback)callback {
    
    NSInteger statusCode = [(NSHTTPURLResponse *)task.response statusCode];
    
    NSError *localError = [NSError errorWithDomain:error.userInfo[NSLocalizedDescriptionKey] code:statusCode userInfo:error.userInfo];
    
    NSLog(@"API: '%@' error with status code %ld , domain : '%@'", api, (long)localError.code, localError.domain);
    
    if (callback) {
        callback(nil, localError);
    }
}

- (void)fetchModelWithAPI:(NSString *)apiName Parms:(NSDictionary *)parms Callback:(FDFetchRequestCallback)callback {
    
    WeakSelf;
    
    [[FDNetworkEngine sharedEngine] addSessionTaskWithAPI:apiName Method:@"GET" Parms:parms Callback:^(NSDictionary *reseponseDic, NSError *error) {
        
        StrongSelf;
        
        if (s_self) {
            
            NSMutableArray *objects = [NSMutableArray array];
            
            if (!error) {
                Class modelClass = NSClassFromString(s_self->_modelMap[apiName]);
                
                if (!modelClass) {
                    NSAssert(NO, @"No class match api:%@", apiName);
                }
                
                NSArray *results = reseponseDic[kResultsKey];
                
                NSError *modelError = nil;
                
                if ([results isKindOfClass:[NSNull class]]) {
                    results = [NSArray new];
                }
                
                objects = [[MTLJSONAdapter modelsOfClass:modelClass fromJSONArray:results error:&modelError] mutableCopy];
                
                DLogError(modelError)
                
                if (modelError) {
                    error = modelError;
                }
            }
            if (callback) {
                callback(error ? nil : objects, error);
            }
        }
    }];
}


#pragma mark - Token Setter & Getter

- (NSString *)token {
    if (!_token) {
        _token = [[NSUserDefaults standardUserDefaults] objectForKey:kTokenKey];
    }
    return _token;
}

- (void)setToken:(NSString *)token {
    _token = token;
    [[NSUserDefaults standardUserDefaults] setObject:_token forKey:kTokenKey];
}


#pragma mark - Helper Method

- (BOOL)networkReachable {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}



@end
