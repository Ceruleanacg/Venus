//
//  FDAccountService.m
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDAccountService.h"

@implementation FDAccountService

+ (BOOL)checkIfNeedLogin {
    NSString *token = [[FDNetworkEngine sharedEngine] token];
    return token.length > 0 ? NO : YES;
}


+ (void)loginWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService requestWithAPI:@"account/login" Method:@"POST" Parms:parms HUD:YES Block:^(BOOL success, NSDictionary *resultDic) {
        
        if (success) {
            [[FDNetworkEngine sharedEngine] setToken:resultDic[kTokenKey]];
        }
        
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)registerWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService requestWithAPI:@"account/register" Method:@"POST" Parms:parms HUD:YES Block:^(BOOL success, NSDictionary *resultDic) {
        
        if (success) {
            [[FDNetworkEngine sharedEngine] setToken:resultDic[kTokenKey]];
        }
        
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)getSMSCodeWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService requestWithAPI:@"account/smscode" Method:@"POST" Parms:parms HUD:YES Block:^(BOOL success, NSDictionary *resultDic) {
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)forgetPasswordWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService requestWithAPI:@"account/forget" Method:@"POST" Parms:parms HUD:YES Block:^(BOOL success, NSDictionary *resultDic) {
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)getUserInfoWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success, FDUser *user))callback {
    [FDWebService requestWithAPI:@"account/info" Method:@"GET" Parms:parms HUD:NO Block:^(BOOL success, NSDictionary *resultDic) {
        
        FDUser *user = nil;
        
        if (success) {
            NSError *error;
            user = [MTLJSONAdapter modelOfClass:[FDUser class] fromJSONDictionary:resultDic error:&error];
        }
        
        if (callback) {
            callback(success, user);
        }
    }];
}

@end
