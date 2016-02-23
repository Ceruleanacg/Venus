//
//  NSAttributedString+Helper.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (Helper)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string Color:(UIColor *)color;

+ (NSAttributedString *)attributedStringWithString:(NSString *)string Color:(UIColor *)color FontSize:(CGFloat)fontSize;

@end
