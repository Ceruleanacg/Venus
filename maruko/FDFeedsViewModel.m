//
//  FDFeedsViewModel.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDFeedsViewModel.h"
#import "FDFeedsTextCell.h"
#import "FDFeedsCell.h"

@implementation FDFeedsViewModel

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FDBaseModel *model = self.objects[indexPath.row];
    
    NSAssert([model isKindOfClass:[FDFeed class]], @"Model is not FDFeed Class");
    
    FDFeed *feed = (FDFeed *)model;
    
    self.cellClass = feed.imageURLs.count ? [FDFeedsCell class] : [FDFeedsTextCell class];
    
    self.reuseIdentifer = NSStringFromClass(self.cellClass);
    
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

@end
