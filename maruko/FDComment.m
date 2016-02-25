//
//  FDComment.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDComment.h"

@implementation FDComment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"objectID"     : @"_id",
             @"user"         : @"user",
             @"content"      : @"content",
             @"createDate"   : @"create_date",
             };
}

@end
