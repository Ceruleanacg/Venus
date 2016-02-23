//
//  FDBaseViewModel.h
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FDNetworkEngine.h"

#import "FDBaseModel.h"

#import "FDBaseCell.h"
#import "FDBaseCollectionCell.h"

typedef enum : NSUInteger {
    FDFetchModeNew,
    FDFetchModeMore,
} FDFetchMode;

@interface FDBaseViewModel : NSObject <UITableViewDataSource, UICollectionViewDataSource>

@property (nonatomic, copy) NSString *api;

@property (nonatomic, strong) NSMutableDictionary *prams;

@property (nonatomic, strong) FDBaseModel *model;

@property (nonatomic, strong) Class cellClass;

@property (nonatomic, strong) NSString *reuseIdentifer;

@property (nonatomic, strong) NSMutableArray *objects;

- (instancetype)initWithAPI:(NSString *)api;

- (instancetype)initWithAPI:(NSString *)api CellClass:(Class)cellClass;

- (void)fetchModelWithType:(FDFetchMode)mode Callback:(FDFetchRequestCallback)callback;

@end
