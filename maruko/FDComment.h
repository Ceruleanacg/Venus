//
//  FDComment.h
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseModel.h"
#import "FDUser.h"

@interface FDComment : FDBaseModel

@property (nonatomic, strong) FDUser *user;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *createDate;

@end
