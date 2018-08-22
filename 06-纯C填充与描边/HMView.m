//
//  HMView.m
//  06-纯C填充与描边
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
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 50);
    CGContextAddLineToPoint(ctx, 50, 50);
    // CGContextAddLineToPoint(ctx, 50, 50);
    // 关闭路径
    CGContextClosePath(ctx);
    
    // 设置线宽
    CGContextSetLineWidth(ctx, 10);
    
    // 渲染
    // CGContextStrokePath(ctx); // 描边
    
    // 填充
    // CGContextFillPath(ctx);
    
    // 画一个路径
    /*
     kCGPathFill, 填充
     kCGPathEOFill,
     kCGPathStroke, 描边
     kCGPathFillStroke,
     kCGPathEOFillStroke
     */
    
    [[UIColor whiteColor] setFill];
    [[UIColor redColor] setStroke];
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}


@end
