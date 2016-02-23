//
//  FDBaseCollectionCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

#import "ColorSheet.h"
#import "LayoutSheet.h"
#import "CategorySheet.h"

#import "FDBaseViewModel.h"

@interface FDBaseCollectionCell : UICollectionViewCell

@property (nonatomic, weak) FDBaseViewModel *viewModel;

@property (nonatomic, strong) FDBaseModel *model;

- (void)bindWithModel:(FDBaseModel *)model;

@end
