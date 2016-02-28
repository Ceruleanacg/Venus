//
//  FDFeedDetailHeaderView.h
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"

#import "FDFeed.h"

@interface FDFeedsDetailCell : FDBaseCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *firstLine;

@property (nonatomic, strong) UILabel *articleLabel;

@property (nonatomic, strong) NSMutableArray *imageViews;

@property (nonatomic, strong) UIView *secondLine;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier feed:(FDFeed *)feed;

@end
