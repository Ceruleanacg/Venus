//
//  FDUser.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDUser.h"

@implementation FDUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"objectID"    : @"_id",
             @"username"    : @"username",
             @"nickname"    : @"nickname",
             @"avatarURL"   : @"avatar_url",
             @"sex"         : @"sex",
             @"age"         : @"age",
             @"favoCount"   : @"favo_count",
             @"followCount" : @"follow_count"
            };
}

@end
