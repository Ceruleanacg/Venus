//
//  FDUser.h
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseModel.h"

typedef enum : NSUInteger {
    FDSexMale,
    FDSexFemale,
} FDSex;

@interface FDUser : FDBaseModel

@property (nonatomic, strong) NSString *username;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *avatarURL;

@property (nonatomic, assign) FDSex sex;

@property (nonatomic, assign) NSInteger age;

@end
