//
//  FDFeedsController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/24.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsViewController.h"
#import "FDAccountService.h"

@implementation FDFeedsViewController {
    UISegmentedControl *_segmentedControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WeakSelf;
    
    NSArray *items = @[@"全部", @"动态", @"新闻"];
    
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    _segmentedControl.bounds = CGRectMake(0, 0, 250, 30);
    _segmentedControl.tintColor = ColorNormalNaviTitle;
    _segmentedControl.selectedSegmentIndex = 0;
    _segmentedControl.segmentedAction = ^(UISegmentedControl *segmentedControl) {
        
        StrongSelf;
        
        segmentedControl.userInteractionEnabled = NO;
        
        NSString *title = items[segmentedControl.selectedSegmentIndex];
        
        if ([title isEqualToString:@"全部"]) {
            s_self.viewModel.prams[@"type"] = nil;
        } else {
            FDFeedType type = [title isEqualToString:@"动态"] ? FDFeedTypeFeed : FDFeedTypeNews;
            s_self.viewModel.prams[@"type"] = @(type);
        }
        
        [s_self.viewModel fetchModelWithType:FDFetchModeNew Callback:^(NSArray *objects, NSError *error) {
            
            SStrongSelf;
            
            [ss_self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, ss_self.tableView.numberOfSections)]
                             withRowAnimation:UITableViewRowAnimationFade];
            
            segmentedControl.userInteractionEnabled = YES;
            
        }];
    };
    
    self.navigationItem.titleView = _segmentedControl;
    
    if (![FDAccountService checkIfNeedLogin]) {
        
        [self.viewModel fetchModelWithType:FDFetchModeNew Callback:^(NSArray *objects, NSError *error) {
            
            StrongSelf;
            
            [s_self.tableView reloadData];
            
        }];
    }
    
}

@end
