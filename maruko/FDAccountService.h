//
//  FDAccountService.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDWebService.h"
#import "FDUser.h"

@interface FDAccountService : FDWebService

+ (BOOL)checkIfNeedLogin;

+ (void)loginWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

+ (void)registerWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

+ (void)getSMSCodeWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

+ (void)forgetPasswordWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

+ (void)getUserInfoWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success, FDUser *user))callback;

@end
