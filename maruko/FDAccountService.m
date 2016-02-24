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

@end
