//
//  NSAttributedString+Helper.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "NSAttributedString+Helper.h"

@implementation NSAttributedString (Helper)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string Color:(UIColor *)color {
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:@{NSForegroundColorAttributeName : color}];
    return attributedString;
}


+ (NSAttributedString *)attributedStringWithString:(NSString *)string Color:(UIColor *)color FontSize:(CGFloat)fontSize {
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:@{NSForegroundColorAttributeName : color,
                                                                                                          NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}];
    return attributedString;
}

@end
