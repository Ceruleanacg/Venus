//
//  FDBaseViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"

@implementation FDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBarItem];
    [self setupNavigationControllerConfig];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([self.navigationController isKindOfClass:[FDNavigationController class]]) {
        [(FDNavigationController *)self.navigationController showTabBarIfNeed];
    }
}

- (void)setupBarItem {
    UIBarButtonItem *leftItem = nil;
    
    if ([self.navigationController.viewControllers count] > 1) {
        leftItem = [FDBarButtonItem itemWithTitle:@"返回" Color:ColorNormalNaviTitle Target:self Action:@selector((goBack))];
    } else {
        if (self.presentingViewController) {
            leftItem = [FDBarButtonItem itemWithTitle:@"返回" Color:ColorNormalNaviTitle Target:self Action:@selector((dismiss))];
        }
    }
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setupNavigationControllerConfig {
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    id<UIGestureRecognizerDelegate> target = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    self.backGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    self.backGestureRecognizer.delegate = self;
    
    [self.view addGestureRecognizer:self.backGestureRecognizer];
    [self.view setUserInteractionEnabled:YES];
    [self.view setBackgroundColor:ColorNormalBGWhite];
    
    if (self.navigationController.navigationBar.isHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)goBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.navigationController.viewControllers.count == 1 ? NO : YES;
}

@end
