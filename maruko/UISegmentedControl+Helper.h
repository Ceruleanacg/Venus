//
//  UISegmentedControl+Helper.h
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void(^FDSegmentedAction)(UISegmentedControl *segmentedControl);

@interface UISegmentedControl (Helper)

@property (nonatomic, strong) FDSegmentedAction segmentedAction;

@end
