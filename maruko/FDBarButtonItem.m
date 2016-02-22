//
//  FDBarButtonItem.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBarButtonItem.h"

@implementation FDBarButtonItem

+ (instancetype)itemWithTitle:(NSString *)title Color:(UIColor *)color Target:(id)target Action:(SEL)action {
    FDBarButtonItem *item = [[FDBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
    item.tintColor = color;
    
    return item;
}

@end
