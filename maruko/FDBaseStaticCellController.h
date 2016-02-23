//
//  FDBaseStaticCellController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"
#import "FDTextFieldCell.h"
#import "FDTextLabelCell.h"

@interface FDBaseStaticCellController : FDBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellsArray;

@end
