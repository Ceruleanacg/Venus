//
//  FDFeedsCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"
#import "FDFeed.h"

@interface FDFeedsCell : FDBaseCell

@property (nonatomic, strong) UIView *topSpaceView;

@property (nonatomic, strong) UIImageView *avatarIcon;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *sourceLabel;

@property (nonatomic, strong) UIView *firstLine;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *feedImageView;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIImageView *favoIcon;

@end
