//
//  UIView+Helper.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIView (Helper)

typedef void(^FDTapAction)(UIView *view);

@property (nonatomic, assign) BOOL isAnimating;

@property (nonatomic, strong) FDTapAction tapAction;

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

- (void)animationWithDuration:(NSTimeInterval)duration animations:(void (^)())animations;

@end
