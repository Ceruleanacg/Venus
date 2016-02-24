//
//  FDBaseCell.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"

@implementation FDBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _line = [UIView new];
        _line.backgroundColor = ColorCellLine;
        
        [self.contentView addSubview:_line];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.bottom.right.equalTo(@0);
            make.height.equalTo(@0.5);
        }];
    }
    return self;
}

- (void)bindWithModel:(FDBaseModel *)model {
    
}


@end
