//
//  UIView+Helper.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "UIView+Helper.h"

static NSString *_actionKey        = @"actionKey";
static NSString *_tapRecognizerKey = @"recognizerKey";

static NSString *_isAnimatingKey   = @"isAnimatingKey";

@implementation UIView (Helper)

- (void)animationWithDuration:(NSTimeInterval)duration animations:(void (^)())animations {
    
    BOOL isAnimating = self.isAnimating;
    
    if (isAnimating) {
        return;
    }
    
    self.isAnimating = YES;
    
    [UIView animateWithDuration:duration animations:animations];
    
    self.isAnimating = NO;
}

- (void)doAction {
    if (self.tapAction) {
        
        __weak typeof(self) w_self = self;
        
        self.tapAction(w_self);
    }
}

#pragma mark - Setter and Getter

- (void)setTapAction:(FDTapAction)tapAction {
    
    if (!self.tapRecognizer) {
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doAction)];
        
        [self addGestureRecognizer:tapRecognizer];
        
        objc_setAssociatedObject(self, &_tapRecognizerKey, tapRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    objc_setAssociatedObject(self, &_actionKey, tapAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FDTapAction)tapAction {
    return objc_getAssociatedObject(self, &_actionKey);
}

- (void)setTapRecognizer:(UITapGestureRecognizer *)tapRecognizer {
    objc_setAssociatedObject(self, &_tapRecognizerKey, tapRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UITapGestureRecognizer *)tapRecognizer {
    return objc_getAssociatedObject(self, &_tapRecognizerKey);
}

- (void)setIsAnimating:(BOOL)isAnimating {
    objc_setAssociatedObject(self, &_isAnimatingKey, @(isAnimating), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isAnimating {
    return [objc_getAssociatedObject(self, &_isAnimatingKey) boolValue];
}


@end
