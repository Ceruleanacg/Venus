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
             @"star"       : @"star",
             @"url"        : @"source_url",
             @"type"       : @"type",
             @"title"      : @"title",
             @"article"    : @"article",
             @"imageURLs"  : @"image_urls",
             @"createDate" : @"create_date"
             };
}

+ (NSValueTransformer *)starJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:FDStar.class];
}

@end
