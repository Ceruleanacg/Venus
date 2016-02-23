//
//  FDBaseStaticCellController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseStaticCellController.h"

@implementation FDBaseStaticCellController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    _tableView.contentInset   = UIEdgeInsetsMake(0, 0, TABBAR_HEIGHT + STATUS_HEIGHT, 0);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = ColorTableSection;
    
    [self.view addSubview:_tableView];
    
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cellsArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellsArray[indexPath.section][indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
