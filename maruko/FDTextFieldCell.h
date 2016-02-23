//
//  FDTextFieldCell.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseCell.h"

@interface FDTextFieldCell : FDBaseCell

@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, strong, readonly) UITextField *textField;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *text;

@end
