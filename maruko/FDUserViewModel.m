//
//  FDUserViewModel.m
//  maruko
//
//  Created by 王澍宇 on 16/2/28.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDUserViewModel.h"

@implementation FDUserViewModel {
    FDUserHeaderCell *_userHeaderCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        if (!_userHeaderCell) {
            _userHeaderCell = [[FDUserHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        }
        
        [_userHeaderCell bindWithModel:_user];
        
        return _userHeaderCell;
        
    } else {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}


@end
