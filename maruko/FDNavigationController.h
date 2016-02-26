//
//  FDNavigationController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FDTabBarController;

@class FDBaseViewModel;

@interface FDNavigationController : UINavigationController

@property (nonatomic, strong) FDTabBarController *fd_tabBarController;

- (void)pushViewController:(Class)viewControllerClass ViewModel:(FDBaseViewModel *)viewModel animated:(BOOL)animated;

- (void)showTabBarIfNeed;

@end
