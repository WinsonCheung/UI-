//
//  HMView.m
//  01-C+OC画线方式二
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
    
    // 1.获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2. 拼接路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 10);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    // 3. 拼接OC的路径
    UIBezierPath *path1 = [UIBezierPath bezierPathWithCGPath:path];
    [path1 addLineToPoint:CGPointMake(150, 50)];
    
    // 4. 把路径添加到上下文当中
    CGContextAddPath(ctx, path1.CGPath);
    
    // 5. 渲染
    CGContextStrokePath(ctx);
}


@end
