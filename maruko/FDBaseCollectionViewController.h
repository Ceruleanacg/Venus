//
//  FDBaseCollectionViewController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <MJRefresh.h>

#import "FDBaseViewController.h"

@interface FDBaseCollectionViewController : FDBaseViewController <UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionViewLayout *layout;

@property (nonatomic, assign) BOOL enableUpRefresh;

@property (nonatomic, assign) BOOL enableDownRrefresh;

@end
