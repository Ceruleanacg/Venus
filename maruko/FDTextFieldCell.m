//
//  FDTextFieldCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDTextFieldCell.h"

@implementation FDTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        WeakSelf;
        
        _textField = [UITextField new];
        _textField.textColor = ColorCellText;
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.doneAction = ^(NSString *text, UITextField *textField) {
            
            StrongSelf;
            
            [s_self resignFirstResponder];
        };
        
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = ColorCellText;
        
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_textField];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.left.equalTo(@20);
            make.bottom.equalTo(@(-5));
            make.width.lessThanOrEqualTo(@70);
        }];
        
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel.mas_right).offset(30);
            make.right.equalTo(@(-20));
            make.centerY.equalTo(_titleLabel).offset(1);
        }];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (NSString *)text {
    return _textField.text;
}

- (void)setText:(NSString *)text {
    _textField.text = text;
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (NSString *)title {
    return _titleLabel.text;
}

@end
