//
//  FDStar.m
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDStar.h"

@implementation FDStar

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name"       : @"star",
             @"avatarURL"  : @"avatar_url",
             @"weiboURL"   : @"weibo_url",
             @"fansCount"  : @"fans_count",
             };
}

@end
