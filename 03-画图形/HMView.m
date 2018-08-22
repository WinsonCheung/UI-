//
//  HMView.m
//  03-画图形
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@implementation HMView

/*
 1. 代码为什么要写在drawrect当中
 因为在这个方法当中可以获取到正确的上下文
 
 2. rect 参数含义
 当前view的bounds
 
 3. drawrect什么时候用
 这个方法是系统调用
 1）当这个 view 第一次显示的时候会调用
 2）当这个view进行重绘的时候会调用
 
 4. 如何重绘
 1）调用某个需要重绘的 view 对象的 setNeedsDisplay方法
 2）调用某个需要重绘的 view 对象的 setNeedsDisplayInRect方法 rect:调用重绘的区域
 
 5. 为什么不能手动调用drawrect
 手动调用的时候可能获取不到正确的上下文
 */

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //    // 1. 矩形
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    //
    //    // 渲染
    //    [path stroke];
    
    //    // 2. 圆角矩形
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:30];
    //    // 渲染
    //    [path stroke];
    
    //    // 3. OC 椭圆
    //    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 100)];
    //    [path stroke];
    
    //    // 4. C的椭圆
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 200));
    //    CGContextStrokePath(ctx);
    
    
    // 5. 画弧线
    //    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
    //    [path stroke];
    
    // 6. C 画圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, 150, 150, 100, 0, M_PI, 0);
    CGContextStrokePath(ctx);
}


@end
