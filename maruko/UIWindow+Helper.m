//
//  UIWindow+Helper.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "UIWindow+Helper.h"

#import "FDNavigationController.h"

@implementation UIWindow (Helper)

+ (void)presentViewController:(UIViewController *)viewController Animated:(BOOL)animated Completion:(void (void))completion {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    UIViewController *presentedViewController = nil;
    
    if ([[window rootViewController] presentedViewController]) {
        presentedViewController = [[window rootViewController] presentedViewController];
    } else {
        presentedViewController = [window rootViewController];
    }
    
    FDNavigationController *navigationController = [[FDNavigationController alloc] initWithRootViewController:viewController];
    
    [presentedViewController presentViewController:navigationController animated:YES completion:nil];
}

@end
