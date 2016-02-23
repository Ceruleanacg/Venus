//
//  FDBaseTableViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseTableViewController.h"
#import "FDRefreshHeader.h"

@implementation FDBaseTableViewController


- (instancetype)init {
    if (self = [super init]) {
        _enableUpRefresh    = YES;
        _enableDownRrefresh = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource      = self.viewModel;
    _tableView.delegate        = self;
    _tableView.rowHeight       = UITableViewAutomaticDimension;
    _tableView.contentInset    = UIEdgeInsetsMake(0, 0, STATUS_HEIGHT + TABBAR_HEIGHT + COMMON_HEIGHT, 0);
    _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_tableView];
    
    WeakSelf;
    
    if (_enableUpRefresh) {
        _tableView.mj_header = [FDRefreshHeader headerWithRefreshingBlock:^{
            StrongSelf;
            
            [s_self.viewModel fetchModelWithType:FDFetchModeNew Callback:^(NSArray *objects, NSError *error) {
                if (!error) {
                    [s_self.tableView reloadData];
                }
                [s_self.tableView.mj_header endRefreshing];
            }];
        }];
    }
    
    if (_enableDownRrefresh) {
        _tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            StrongSelf;
            
            [s_self.viewModel fetchModelWithType:FDFetchModeMore Callback:^(NSArray *objects, NSError *error) {
                if (!error) {
                    [s_self.tableView reloadData];
                }
                [s_self.tableView.mj_footer endRefreshing];
            }];
            
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
