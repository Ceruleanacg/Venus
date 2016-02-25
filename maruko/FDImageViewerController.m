//
//  FDImageViewerController.m
//  maruko
//
//  Created by 王澍宇 on 16/2/25.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDImageViewerController.h"

@implementation FDImageViewerController

+ (void)previewImage:(UIImage *)image {
    
    FDImageViewerController *viewerController = [[self alloc] init];
    viewerController.image = image;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    UIViewController *presentedViewController = nil;
    
    if ([[window rootViewController] presentedViewController]) {
        presentedViewController = [[window rootViewController] presentedViewController];
    } else {
        presentedViewController = [window rootViewController];
    }
    
    [presentedViewController presentViewController:viewerController animated:YES completion:nil];
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
        [s_self dismissViewControllerAnimated:YES completion:nil];
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
