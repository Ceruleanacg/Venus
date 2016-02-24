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
    [FDWebService commonRequestWithAPI:@"account/login" Method:@"POST" Parms:parms Block:^(BOOL success, NSDictionary *resultDic) {
        
        if (success) {
            [[FDNetworkEngine sharedEngine] setToken:resultDic[kTokenKey]];
        }
        
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)registerWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService commonRequestWithAPI:@"account/register" Method:@"POST" Parms:parms Block:^(BOOL success, NSDictionary *resultDic) {
        
        if (success) {
            [[FDNetworkEngine sharedEngine] setToken:resultDic[kTokenKey]];
        }
        
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)getSMSCodeWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService commonRequestWithAPI:@"account/smscode" Method:@"POST" Parms:parms Block:^(BOOL success, NSDictionary *resultDic) {
        if (callback) {
            callback(success);
        }
    }];
}

+ (void)forgetPasswordWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService commonRequestWithAPI:@"account/forget" Method:@"POST" Parms:parms Block:^(BOOL success, NSDictionary *resultDic) {
        if (callback) {
            callback(success);
        }
    }];
}

@end
