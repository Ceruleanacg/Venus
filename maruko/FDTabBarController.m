//
//  FDTabBarController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/22.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDTabBarController.h"

@implementation FDTabBarController {
    
    UIView *_tabLine;
    
    NSMutableArray *_buttons;
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers Titles:(NSArray *)titles Images:(NSArray *)images SelectedImages:(NSArray *)selectedImages {
    if (self = [super init]) {
        
        _viewControllers = [viewControllers copy];
        _titles          = [titles copy];
        _images          = [images copy];
        _selectedImages  = [selectedImages copy];
        
        _buttons = [NSMutableArray new];
        
        
        _tabBar = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TABBAR_HEIGHT, SCREEN_WIDTH, TABBAR_HEIGHT)];
        _tabBar.backgroundColor = ColorBGWhite;
        
        [self.view addSubview:_tabBar];
        
        _tabLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        _tabLine.backgroundColor = ColorTabLine;
        
        [_tabBar addSubview:_tabLine];
        
        WeakSelf;
        
        CGFloat iconWidth = SCREEN_WIDTH / _viewControllers.count;
        
        for (NSInteger index = 0; index < _viewControllers.count; ++index) {
            
            FDTabButton *button = [FDTabButton buttonWithTitle:_titles[index]
                                                      FontSize:10
                                                         Image:_images[index]
                                                 SelectedImage:_selectedImages[index]
                                                         Color:ColorTabTitle
                                                 SelectedColor:ColorTabTitle_H];
            
            button.tapAction = ^(UIView *view) {
                
                StrongSelf;
                
                FDTabButton *btn = (FDTabButton *)view;
                
                [btn setSelected:YES];
                
                for (FDTabButton *__btn in s_self->_buttons) {
                    if (__btn != btn) {
                        [__btn setSelected:NO];
                    }
                }
                
                [s_self loadViewController:s_self.viewControllers[index]];
            };
            
            [_buttons addObject:button];
            
            [_tabBar addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_tabBar).offset(index * iconWidth);
                make.top.equalTo(@8);
                make.bottom.equalTo(@0);
                make.width.equalTo(@(iconWidth));
            }];
            
            FDNavigationController *naviController = _viewControllers[index];
            naviController.fd_tabBarController = self;
        }
        
        [[_buttons firstObject] setSelected:YES];
        
        [self loadViewController:[_viewControllers firstObject]];
    }
    return self;
}

- (void)loadViewController:(FDNavigationController *)naviController {
    
    if (_currentController == naviController) {
        return;
    }
    
    [self.currentController.view removeFromSuperview];
    
    [self setCurrentController:naviController];
    
    [self.view addSubview:_currentController.view];
    
    [self addChildViewController:_currentController];
    
    [self.view bringSubviewToFront:_tabBar];
}

@end