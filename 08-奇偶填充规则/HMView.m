//
//  HMView.m
//  08-奇偶填充规则
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@implementation HMView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 150) radius:80 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(250, 30, 20, 200)];
    
    CGContextAddPath(ctx, path2.CGPath);
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    
    // 说明: 被覆盖过奇数次的点填充，被覆盖过的偶数次的点不填充
    
    /*
     kCGPathFill, 填充
     kCGPathEOFill,
     kCGPathStroke, 描边
     kCGPathFillStroke,
     kCGPathEOFillStroke
     */
    CGContextDrawPath(ctx, kCGPathEOFill);
}


@end
