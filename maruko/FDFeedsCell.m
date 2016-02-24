//
//  FDFeedsCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsCell.h"

@implementation FDFeedsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.line.hidden = YES;
        
        _avatarIcon  = [[UIImageView alloc] init];
        
        _nameLabel   = [UILabel labelWithText:@"" Color:ColorFeedName FontSize:12 Alignment:NSTextAlignmentLeft];
        
        _sourceLabel = [UILabel labelWithText:@"  ·  ·  " Color:ColorFeedSource FontSize:10 Alignment:NSTextAlignmentRight];
        
        _firstLine   = [[UIView alloc] init];
        _firstLine.backgroundColor = ColorFeedLine;
        
        _titleLabel  = [UILabel labelWithText:@"" Color:ColorFeedTitle FontSize:14 Alignment:NSTextAlignmentLeft];
        
        _feedImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_avatarIcon];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_sourceLabel];
        [self.contentView addSubview:_firstLine];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_feedImageView];
        
        [_avatarIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.left.equalTo(@10);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avatarIcon.mas_right).offset(10);
            make.centerY.equalTo(_avatarIcon);
        }];
        
        [_sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(@(-10));
            make.centerY.equalTo(_avatarIcon);
        }];
        
        [_firstLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avatarIcon.mas_bottom).offset(5);
            make.left.right.equalTo(@0);
            make.height.equalTo(@0.5);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_firstLine.mas_bottom).offset(10);
            make.left.equalTo(@10);
            make.right.equalTo(@(-10));
        }];
        
        [_feedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.right.equalTo(_titleLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
            make.height.equalTo(@190);
        }];
        
        [_favoIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_infoLabel);
            make.right.equalTo(@(-10));
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        
        [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.top.equalTo(_feedImageView.mas_bottom).offset(10);
            make.bottom.equalTo(@(-5));
        }];
    }
    
    return self;
}

- (void)bindWithModel:(FDBaseModel *)model {
    
}


@end
