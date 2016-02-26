//
//  FDTextViewController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/26.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"

typedef void(^FDTextViewControllerCallback)(NSString *text, FDBaseViewController *viewController);

@interface FDTextViewController : FDBaseViewController

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) FDTextViewControllerCallback callback;

@end
