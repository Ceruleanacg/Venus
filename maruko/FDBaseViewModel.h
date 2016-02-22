//
//  FDBaseViewModel.h
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    FDFetchModeNew,
    FDFetchModeMore,
} FDFetchMode;

@interface FDBaseViewModel : NSObject

- (instancetype)initWithAPI:(NSString *)api CellClass:(Class)cellClass;

@end
