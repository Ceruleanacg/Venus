//
//  UILabel+Helper.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Helper)

+ (UILabel *)labelWithText:(NSString *)text Color:(UIColor *)color FontSize:(CGFloat)fontSize Alignment:(NSTextAlignment)alignment;

@end
