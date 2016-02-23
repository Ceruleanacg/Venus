//
//  UITextField+Helper.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^FDTextFieldAction)(NSString *text, UITextField *textField);

@interface UITextField (Helper)

@property (nonatomic, strong) FDTextFieldAction editingAction;

@property (nonatomic, strong) FDTextFieldAction beginAction;

@property (nonatomic, strong) FDTextFieldAction doneAction;


@end
