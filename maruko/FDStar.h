//
//  FDStar.h
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseModel.h"

@interface FDStar : FDBaseModel

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *avatarURL;

@property (nonatomic, strong) NSString *weiboURL;

@property (nonatomic, assign) NSInteger fansCount;

@end
