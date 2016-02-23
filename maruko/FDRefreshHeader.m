//
//  FDRefreshHeader.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDRefreshHeader.h"

@implementation FDRefreshHeader {
    UIView *_circleContentView;
    UIImageView *_circle;
}

- (void)prepare {
    [super prepare];
    
    self.mj_h = 50;
    
    _circle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Main_Refresh"]];
    
    _circleContentView = [UIView new];
    
    [self addSubview:_circleContentView];
    [_circleContentView addSubview:_circle];
}

- (void)placeSubviews {
    [super placeSubviews];
    
    _circleContentView.center  = CGPointMake(self.center.x, self.mj_h - 30);
    _circleContentView.mj_size = CGSizeMake(20, 20);
    
    _circle.mj_size = CGSizeMake(20, 20);
    _circle.bounds  = _circleContentView.bounds;
}

- (void)setState:(MJRefreshState)state {
    
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            break;
        case MJRefreshStatePulling:
            break;
        case MJRefreshStateRefreshing:
            break;
        default:
            break;
    }
}

- (void)beginRefreshing {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.pullingPercent = 0.0;
    }];
    
    if (self.window) {
        
        self.state = MJRefreshStateRefreshing;
        
    } else {
        
        self.state = MJRefreshStateWillRefresh;
        
        [self setNeedsDisplay];
    }
}

- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    
    _circle.transform = CGAffineTransformMakeRotation(pullingPercent * M_PI);
}

@end
