//
//  FDTabButton.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

#import "CategorySheet.h"

@interface FDTabButton : UIView

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIColor *selectedColor;

@property (nonatomic, assign) BOOL selected;

+ (instancetype)buttonWithTitle:(NSString *)title
                       FontSize:(CGFloat)fontSize
                          Image:(UIImage *)image
                  SelectedImage:(UIImage *)selectedImage
                          Color:(UIColor *)color
                  SelectedColor:(UIColor *)selectedColor;

@end
