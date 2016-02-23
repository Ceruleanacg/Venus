//
//  FDTextLabelCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"

@interface FDTextLabelCell : FDBaseCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *content;

@end
