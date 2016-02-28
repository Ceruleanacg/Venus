//
//  FDFeedsDetailViewModel.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsDetailViewModel.h"

@implementation FDFeedsDetailViewModel {
    FDFeedsDetailCell *_feedsDetailCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        if (!_feedsDetailCell) {
            _feedsDetailCell = [[FDFeedsDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil feed:_feed];
            _feedsDetailCell.tableView = tableView;
        }
        
        // Feed 在本地，不需要再次Binding
        
        return _feedsDetailCell;
        
    } else {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}

@end
