//
//  FDBaseViewController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

#import "FDNavigationController.h"
#import "FDBaseViewModel.h"

#import "ComponentSheet.h"
#import "CategorySheet.h"
#import "LayoutSheet.h"
#import "ColorSheet.h"
#import "Marcos.h"

@interface FDBaseViewController : UIViewController

@property (nonatomic, strong) FDBaseViewModel *viewModel;

- (void)goBack;

- (void)dismiss;

@end
