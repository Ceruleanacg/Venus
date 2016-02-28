//
//  FDTextViewController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/26.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDTextViewController.h"

@implementation FDTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FDBarButtonItem *rightItem = [FDBarButtonItem itemWithTitle:@"完成" Color:ColorNormalNaviTitle Target:self Action:@selector(finish:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    _textView = [UITextView new];
    _textView.textColor = ColorTextContent;
    _textView.font = [UIFont systemFontOfSize:16];
    
    [self.view addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@10);
        make.right.equalTo(@(-10));
        make.height.equalTo(@(self.view.bounds.size.height / 2));
    }];
    
    [_textView becomeFirstResponder];
}

- (void)finish:(FDBarButtonItem *)item {
    if (_callback) {
        _callback(_textView.text, self);
    }
}

@end
