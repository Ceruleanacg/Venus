//
//  FDUserHeaderCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/28.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDUserHeaderCell.h"

@implementation FDUserHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.line.hidden = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _avatarIcon = [UIImageView new];
        _avatarIcon.layer.cornerRadius = 40;
        _avatarIcon.clipsToBounds = YES;
        
        _nameLabel  = [UILabel labelWithText:@"" Color:ColorCellText FontSize:16 Alignment:NSTextAlignmentCenter Light:YES];
        
        _leftLabel  = [UILabel labelWithText:@"" Color:ColorCellText FontSize:14 Alignment:NSTextAlignmentLeft Light:YES];
        
        _rightLabel = [UILabel labelWithText:@"" Color:ColorCellText FontSize:14 Alignment:NSTextAlignmentRight Light:YES];
        
        _vecLine = [UIView new];
        _vecLine.backgroundColor = ColorCellVecLine;
        
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = ColorTableSection;
        
        [self.contentView addSubview:_avatarIcon];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_leftLabel];
        [self.contentView addSubview:_rightLabel];
        [self.contentView addSubview:_vecLine];
        [self.contentView addSubview:_bottomLine];
        
        [_avatarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@20);
            make.centerX.equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avatarIcon.mas_bottom).offset(10);
            make.centerX.equalTo(@(0));
        }];
        
        [_vecLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(20);
            make.centerX.equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(0.5, 25));
        }];
        
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_vecLine);
            make.right.equalTo(_vecLine.mas_left).offset(-50);
        }];
        
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_vecLine);
            make.left.equalTo(_vecLine.mas_right).offset(50);
        }];
        
        [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_vecLine.mas_bottom).offset(10);
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@10);
        }];
    }
    return self;
}

- (void)bindWithModel:(FDBaseModel *)model {
    if (![model isKindOfClass:[FDUser class]]) {
        return;
    }
    
    FDUser *user = (FDUser *)model;
    
    [_avatarIcon sd_setImageWithURL:[NSURL URLWithString:user.avatarURL] placeholderImage:FDImageWithName(@"Star_Avatar_Placeholder")];
    
    _nameLabel.text = user.nickname;
    
    _leftLabel.text = [NSString stringWithFormat:@"%ld 收藏", user.favoCount];
    
    _rightLabel.text = [NSString stringWithFormat:@"%ld 关注", user.followCount];
}

@end
