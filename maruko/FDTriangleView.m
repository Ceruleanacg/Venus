//
//  FDTriangleView.m
//  maruko
//
//  Created by 王澍宇 on 16/2/23.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import "FDTriangleView.h"

@implementation FDTriangleView

- (instancetype)init {
    if (self = [super init]) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(6, 0)];
        [path addLineToPoint:CGPointMake(12, 8)];
        [path addLineToPoint:CGPointMake(0, 8)];
        [path addLineToPoint:CGPointMake(6, 0)];
        [path closePath];
        
        _triangleLayer = [CAShapeLayer new];
        _triangleLayer.path = path.CGPath;
        _triangleLayer.fillColor = [UIColor whiteColor].CGColor;
        _triangleLayer.shadowOpacity = 0.2;
        
        [self.layer addSublayer:_triangleLayer];
    }
    return self;
}


@end
