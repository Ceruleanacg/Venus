//
//  FDAccountService.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDWebService.h"

@interface FDAccountService : FDWebService

+ (void)loginWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

+ (void)registerWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

@end
