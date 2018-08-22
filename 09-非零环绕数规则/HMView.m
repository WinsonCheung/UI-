//
//  HMView.m
//  09-非零环绕数规则
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
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:1];
    
    CGContextAddPath(ctx, path1.CGPath);
    CGContextAddPath(ctx, path.CGPath);
    
    // 默认填充模式：nonzero winding number rule (非零环绕数规则)从左到右跨过，+1，从右到左跨过，-1，最后如果为0，那么不填充，否则填充
    
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
