//
//  FDFeed.m
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeed.h"

@implementation FDFeed

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"objectID"     : @"_id",
             @"star"         : @"star",
             @"url"          : @"url",
             @"type"         : @"type",
             @"title"        : @"title",
             @"source"       : @"source",
             @"article"      : @"article",
             @"imageURLs"    : @"image_urls",
             @"createDate"   : @"create_date",
             @"readCount"    : @"read_count",
             @"commentCount" : @"comment_count"
             };
}

+ (NSValueTransformer *)starJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:FDStar.class];
}

@end
