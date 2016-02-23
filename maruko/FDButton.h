//
//  FDButton.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ColorSheet.h"

@class FDButton;

typedef void(^FDButtonAction)(FDButton *button);

@interface FDButton : UIButton

@property (nonatomic, strong) FDButtonAction actionBlock;

+ (instancetype)buttonWithType:(UIButtonType)buttonType ActionBlock:(FDButtonAction)actionBlock;

+ (instancetype)buttonWithType:(UIButtonType)buttonType Title:(NSString *)title FontSize:(CGFloat)fontSize ActionBlock:(FDButtonAction)actionBlock;

@end
