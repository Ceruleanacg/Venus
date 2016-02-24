//
//  FDBaseCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

#import "Marcos.h"
#import "ColorSheet.h"
#import "LayoutSheet.h"
#import "CategorySheet.h"
#import "ComponentSheet.h"

#import "FDBaseViewModel.h"
#import "FDBaseModel.h"

@interface FDBaseCell : UITableViewCell

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) FDBaseViewModel *viewModel;

@property (nonatomic, strong) FDBaseModel *model;

@property (nonatomic, strong) UIView *line;

- (void)bindWithModel:(FDBaseModel *)model;

@end
