//
//  FDTabBarController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"
#import "FDTabButton.h"

@class FDNavigationController;

@interface FDTabBarController : FDBaseViewController

@property (nonatomic, strong) UIView *tabBar;

@property (nonatomic, strong) NSArray<FDNavigationController *> *viewControllers;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic, strong) NSArray *selectedImages;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) FDNavigationController *currentController;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers Titles:(NSArray *)titles Images:(NSArray *)images SelectedImages:(NSArray *)selectedImages;

@end
