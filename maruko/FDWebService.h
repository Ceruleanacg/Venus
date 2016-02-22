//
//  FDWebService.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>

#import "FDNetworkEngine.h"

@interface FDWebService : NSObject

+ (void)commonRequestWithAPI:(NSString *)api
                      Method:(NSString *)method
                       Parms:(NSDictionary *)parms
                       Block:(void (^)(BOOL success, NSDictionary *resultDic))block;

@end
