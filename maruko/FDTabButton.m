//
//  FDTabButton.m
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDTabButton.h"

@implementation FDTabButton

+ (instancetype)buttonWithTitle:(NSString *)title
                       FontSize:(CGFloat)fontSize
                          Image:(UIImage *)image
                  SelectedImage:(UIImage *)selectedImage
                          Color:(UIColor *)color
                  SelectedColor:(UIColor *)selectedColor {
    
    FDTabButton *button = [[FDTabButton alloc] init];
    
    button.imageView = [[UIImageView alloc] initWithImage:image highlightedImage:selectedImage];
    button.imageView.userInteractionEnabled = YES;
    
    button.titleLabel = [UILabel labelWithText:title Color:color FontSize:fontSize Alignment:NSTextAlignmentCenter];
    button.titleLabel.userInteractionEnabled = YES;
    
    button.color = color;
    button.selectedColor = selectedColor;
    
    [button addSubview:button.imageView];
    [button addSubview:button.titleLabel];
    
    [button.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.centerX.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(25, 27));
    }];
    
    [button.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.imageView.mas_bottom).offset(4);
        make.centerX.equalTo(button.imageView);
    }];
    
    return button;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    _titleLabel.textColor  = _selected ? _selectedColor : _color;
    _imageView.highlighted = _selected ? YES : NO;
}

@end
