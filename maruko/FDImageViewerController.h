//
//  FDImageViewerController.h
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDBaseViewController.h"

@interface FDImageViewerController : FDBaseViewController <UIScrollViewDelegate>

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@property (nonatomic, strong, readonly) UIImageView *imageView;

@property (nonatomic, strong) UIImage *image;

+ (void)previewImage:(UIImage *)image;

@end
