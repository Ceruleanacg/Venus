//
//  FDStarService.m
//  maruko
//
//  Created by 王澍宇 on 16/2/26.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDStarService.h"

@implementation FDStarService

+ (void)postCommentWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback {
    [FDWebService requestWithAPI:@"star/news/comment" Method:@"POST" Parms:parms HUD:YES Block:^(BOOL success, NSDictionary *resultDic) {
        if (callback) {
            callback(success);
        }
    }];
}

@end
