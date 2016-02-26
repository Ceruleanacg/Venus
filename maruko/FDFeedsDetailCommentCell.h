//
//  FDFeedsDetailCommentCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"
#import "FDComment.h"

@interface FDFeedsDetailCommentCell : FDBaseCell

@property (nonatomic, strong) UIImageView *avatarIcon;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *createDateLabel;

@end
