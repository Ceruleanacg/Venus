//
//  FDNetworkEngine.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^FDRequestCallback)(NSDictionary *responseDic, NSError *error);

typedef enum : NSUInteger {
    FDStatusError = -1,
    FDStatusSuccess = 0,
} FDStatus;

@interface FDNetworkEngine : NSObject

+ (instancetype)sharedEngine;

- (void)addSessionTaskWithAPI:(NSString *)api Method:(NSString *)method Parms:(NSDictionary *)parms Callback:(FDRequestCallback)callback;

@end
