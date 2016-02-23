//
//  UILabel+Helper.m
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "UILabel+Helper.h"

@implementation UILabel (Helper)

+ (UILabel *)labelWithText:(NSString *)text Color:(UIColor *)color FontSize:(CGFloat)fontSize Alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [UILabel new];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = color ? color : [UIColor whiteColor];
    label.textAlignment = alignment;
    
    return label;
}

@end
