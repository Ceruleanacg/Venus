//
//  FDNavigationController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDNavigationController.h"
#import "FDTabBarController.h"

@implementation FDNavigationController

- (void)pushViewController:(Class)viewControllerClass ViewModel:(FDBaseViewModel *)viewModel animated:(BOOL)animated {
    if ([viewControllerClass isSubclassOfClass:[FDBaseViewController class]]) {
        
        FDBaseViewController *viewController = [[viewControllerClass alloc] init];
        viewController.viewModel = viewModel;
        
        [self pushViewController:viewController animated:YES];
    } else {
        NSAssert(NO, @"Class given is not subclass of CPBaseViewController");
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.fd_tabBarController && self.viewControllers.count == 1) {
        [UIView animateWithDuration:0.2 animations:^{
            self.fd_tabBarController.tabBar.alpha = 0.0;
        }];
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)showTabBar {
    if (self.fd_tabBarController && self.viewControllers.count == 1) {
        [UIView animateWithDuration:0.2 animations:^{
            self.fd_tabBarController.tabBar.alpha = 1.0;
        }];
    }
}

@end
