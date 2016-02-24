//
//  FDFeed.h
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseModel.h"
#import "FDStar.h"

typedef enum : NSUInteger {
    FDFeedTypeNews,
    FDFeedTypeFeed,
} FDFeedType;

@interface FDFeed : FDBaseModel

@property (nonatomic, strong) FDStar *star;

@property (nonatomic, strong) NSString *url;

@property (nonatomic, strong) NSString *source;

@property (nonatomic, assign) FDFeedType type;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *article;

@property (nonatomic, strong) NSArray *imageURLs;

@property (nonatomic, strong) NSString *createDate;

@property (nonatomic, assign) NSInteger readCount;

@property (nonatomic, assign) NSInteger commentCount;

@end
