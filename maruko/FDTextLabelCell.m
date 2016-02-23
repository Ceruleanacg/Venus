//
//  FDTextLabelCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDTextLabelCell.h"

@implementation FDTextLabelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = ColorCellText;
        
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont systemFontOfSize:17];
        _contentLabel.textColor = ColorCellText;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_contentLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.top.equalTo(@5);
            make.bottom.equalTo(@(-5));
            make.width.lessThanOrEqualTo(@80);
        }];
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-20));
            make.centerY.equalTo(_titleLabel);
            make.left.equalTo(_titleLabel.mas_right).offset(20);
        }];
    }
    return self;
}

- (NSString *)title {
    return _titleLabel.text;
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (NSString *)content {
    return _contentLabel.text;
}

- (void)setContent:(NSString *)content {
    _contentLabel.text = content;
}

@end
