//
//  FDBarButtonItem.h
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDBarButtonItem : UIBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title Color:(UIColor *)color Target:(id)target Action:(SEL)action;

@end
