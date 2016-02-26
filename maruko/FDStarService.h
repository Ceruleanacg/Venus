//
//  FDStarService.h
//  maruko
//
//  Created by 王澍宇 on 16/2/26.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDWebService.h"

@interface FDStarService : FDWebService

+ (void)postCommentWithParms:(NSDictionary *)parms Callback:(void (^)(BOOL success))callback;

@end
