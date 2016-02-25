//
//  UISegmentedControl+Helper.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "UISegmentedControl+Helper.h"

static NSString *_actionKey = @"actionKey";

@implementation UISegmentedControl (Helper)

- (void)doAction {
    if (self.segmentedAction) {
        __weak typeof(self) w_self = self;
        self.segmentedAction(w_self);
    }
}
#pragma mark - Setter and Getter

- (void)setSegmentedAction:(FDSegmentedAction)segmentedAction {
    
    [self removeTarget:self action:@selector(doAction) forControlEvents:UIControlEventValueChanged];
    [self addTarget:self action:@selector(doAction) forControlEvents:UIControlEventValueChanged];
    
    objc_setAssociatedObject(self, &_actionKey, segmentedAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (FDSegmentedAction)segmentedAction {
    return objc_getAssociatedObject(self, &_actionKey);
}

@end
