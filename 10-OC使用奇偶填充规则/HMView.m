//
//  HMView.m
//  10-OC使用奇偶填充规则
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
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
    [path addArcWithCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:1];
    path.usesEvenOddFillRule = YES;
    
    [path fill];
}


@end
