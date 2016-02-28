//
//  FDStarViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/28.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDUserViewController.h"

@implementation FDUserViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"我的";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FDAccountService getUserInfoWithParms:[NSDictionary new] Callback:^(BOOL success, FDUser *user) {
        if (success) {
            [(FDUserViewModel *)self.viewModel setUser:user];
            [self.tableView reloadData];
        }
    }];
}

@end
