//
//  FDBaseCollectionViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCollectionViewController.h"
#import "FDRefreshHeader.h"

@implementation FDBaseCollectionViewController


- (instancetype)init {
    if (self = [super init]) {
        _enableUpRefresh    = YES;
        _enableDownRrefresh = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout ? _layout : [UICollectionViewFlowLayout new]];
    _collectionView.dataSource      = self.viewModel;
    _collectionView.delegate        = self;
    _collectionView.contentInset    = UIEdgeInsetsMake(0, 0, STATUS_HEIGHT + TABBAR_HEIGHT + COMMON_HEIGHT, 0);
    _collectionView.backgroundColor = ColorBGWhite;
    
    [_collectionView registerClass:self.viewModel.cellClass forCellWithReuseIdentifier:self.viewModel.reuseIdentifer];
    
    [self.view addSubview:_collectionView];
    
    WeakSelf;
    
    if (_enableUpRefresh) {
        _collectionView.mj_header = [FDRefreshHeader headerWithRefreshingBlock:^{
            StrongSelf;
            
            [s_self.viewModel fetchModelWithType:FDFetchModeNew Callback:^(NSArray *objects, NSError *error) {
                if (!error) {
                    [s_self.collectionView reloadData];
                }
                [s_self.collectionView.mj_header endRefreshing];
            }];
        }];
    }
    
    if (_enableDownRrefresh) {
        _collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            StrongSelf;
            
            [s_self.viewModel fetchModelWithType:FDFetchModeMore Callback:^(NSArray *objects, NSError *error) {
                if (!error) {
                    [s_self.collectionView reloadData];
                }
                [s_self.collectionView.mj_footer endRefreshing];
            }];
            
        }];
    }
}

@end
