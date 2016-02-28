//
//  FDUserHeaderCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/28.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"

@interface FDUserHeaderCell : FDBaseCell

@property (nonatomic, strong) UIImageView *avatarIcon;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIView *vecLine;

@property (nonatomic, strong) UIView *bottomLine;

@end
