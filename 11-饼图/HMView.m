//
//  HMView.m
//  11-饼图
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@implementation HMView

+ (instancetype)pieView {
    UINib *nib = [UINib nibWithNibName:@"HMView" bundle:nil];
    HMView *view = [nib instantiateWithOwner:nil options:nil][0];
    return view;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat start = 0, end = 0;
    
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) *0.5 - 10;
    
    for (int i = 0; i< self.values.count;i++) {
        
        end = 2 * M_PI *[self.values[i] floatValue] + start;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:1];
        [path addLineToPoint:center];
        [[UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1] set];
        
        [path fill];
        
        // 下一次的起点 等于上一次的重点
        start = end;
        
    }
}


@end
