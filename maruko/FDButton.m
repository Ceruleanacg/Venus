//
//  FDButton.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDButton.h"

@implementation FDButton {
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType ActionBlock:(FDButtonAction)actionBlock {
    FDButton *button = [FDButton buttonWithType:buttonType];
    
    [button setActionBlock:actionBlock];
    
    return button;
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType Title:(NSString *)title FontSize:(CGFloat)fontSize ActionBlock:(FDButtonAction)actionBlock {
    FDButton *button = [FDButton buttonWithType:buttonType ActionBlock:actionBlock];
    
    [button setTitleColor:ColorButtonTitle forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

- (void)doAction {
    
    if (_actionBlock) {
        _actionBlock(self);
    }
}

- (void)setActionBlock:(FDButtonAction)actionBlock {
    _actionBlock = actionBlock;
    [self removeTarget:self action:@selector(doAction) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(doAction) forControlEvents:UIControlEventTouchUpInside];
}

@end
