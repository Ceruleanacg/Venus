//
//  FDBaseViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"
#import "FDBarButtonItem.h"
#import "ColorSheet.h"

@implementation FDBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = nil;
    
    if ([self.navigationController.viewControllers count] > 1) {
        leftItem = [FDBarButtonItem itemWithTitle:@"返回" Color:ColorNormalNaviTitle Target:self Action:@selector((goBack))];
    } else {
        if (self.presentingViewController) {
            leftItem = [FDBarButtonItem itemWithTitle:@"返回" Color:ColorNormalNaviTitle Target:self Action:@selector((dismiss))];
        }
    }
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    id<UIGestureRecognizerDelegate> target = self.navigationController.interactivePopGestureRecognizer.delegate;
    
    self.backGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    self.backGestureRecognizer.delegate = self;
    
    [self.view addGestureRecognizer:self.backGestureRecognizer];
    [self.view setUserInteractionEnabled:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    if (self.navigationController.navigationBar.isHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([self.navigationController isKindOfClass:[FDNavigationController class]]) {
        [(FDNavigationController *)self.navigationController showTabBar];
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
