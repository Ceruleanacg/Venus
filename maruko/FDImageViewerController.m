//
//  FDImageViewerController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDImageViewerController.h"

static FDImageViewerController *imageViewerController = nil;

@implementation FDImageViewerController

+ (void)previewWithContentView:(UIView *)contentView Image:(UIImage *)image {
    
    if (!imageViewerController) {
        imageViewerController = [[self alloc] init];
    }
    
    imageViewerController.image = image;
    imageViewerController.contentView = contentView;
    
    [UIView transitionFromView:imageViewerController.contentView
                        toView:imageViewerController.view
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    WeakSelf;
    
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = _image;
    _imageView.userInteractionEnabled = YES;
    _imageView.tapAction = ^(UIView *view) {
        StrongSelf;
        [UIView transitionFromView:s_self.view
                            toView:s_self.contentView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        completion:nil];
    };
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = self.view.bounds.size;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.delegate = self;
    
    [_scrollView addSubview:_imageView];
    
    [self.view addSubview:_scrollView];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

@end
