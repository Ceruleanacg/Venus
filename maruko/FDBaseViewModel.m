//
//  FDBaseViewModel.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewModel.h"
#import "FDBaseCell.h"
#import "FDBaseCollectionCell.h"

@implementation FDBaseViewModel {
    BOOL _isFetching;
}

- (instancetype)initWithAPI:(NSString *)api {
    if (self = [super init]) {
        _api     = api;
        _prams   = [NSMutableDictionary dictionary];
        _objects = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithAPI:(NSString *)api CellClass:(Class)cellClass {
    if (self = [self initWithAPI:api]) {
        _cellClass      = cellClass;
        _reuseIdentifer = @"ReuseIdentifier";
    }
    return self;
}

- (void)fetchModelWithType:(FDFetchMode)mode Callback:(FDFetchRequestCallback)callback {
    
    if (_isFetching) {
        return;
    }
    
    _isFetching = YES;
    
    NSMutableDictionary *parms = [[NSMutableDictionary alloc] initWithDictionary:_prams];
    
    if (mode == FDFetchModeMore) {
        parms[@"last_id"]  = [(FDBaseModel *)[_objects lastObject] objectID];
    }
    
    WeakSelf;
    
    [[FDNetworkEngine sharedEngine] fetchModelWithAPI:_api Parms:[parms copy] Callback:^(NSArray *objects, NSError *error) {
        
        StrongSelf;
        
        if (!error) {
            
            switch (mode) {
                case FDFetchModeNew:
                    
                    [s_self.objects removeAllObjects];
                    [s_self.objects addObjectsFromArray:objects];
                    
                    break;
                    
                case FDFetchModeMore:
                    
                    [s_self.objects addObjectsFromArray:objects];
                    
                    break;
                    
                default:
                    break;
            }
            
            if (callback) {
                callback(objects, nil);
            }
            
        } else {
            if (callback) {
                callback(nil, error);
            }
        }
        
        s_self->_isFetching = NO;
    }];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FDBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseIdentifer];
    
    if (!cell) {
        cell = [[_cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_reuseIdentifer];
        cell.tableView = tableView;
        cell.viewModel = self;
    }
    
    [cell bindWithModel:_objects[indexPath.row]];
    
    return cell;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _objects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FDBaseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_reuseIdentifer forIndexPath:indexPath];
    
    [cell bindWithModel:_objects[indexPath.row]];
    
    return cell;
}

@end
