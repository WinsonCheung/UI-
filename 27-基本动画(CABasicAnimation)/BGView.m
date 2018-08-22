//
//  BGView.m
//  27-基本动画(CABasicAnimation)
//
//  Created by winson on 2018/7/12.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "BGView.h"

@implementation BGView


- (void)drawRect:(CGRect)rect {

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:150 startAngle:0 endAngle:2*M_PI clockwise:1];
    path.lineWidth = 10;
    [[UIColor grayColor] set];
    [path stroke];
}


@end
