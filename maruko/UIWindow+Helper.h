//
//  UIWindow+Helper.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Helper)

+ (void)presentViewController:(UIViewController *)viewController Animated:(BOOL)animated Completion:(void (void))completion;

@end
