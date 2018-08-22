//
//  HMView.m
//  04-纯C画线样式、线宽、样式与颜色
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
    CGContextAddLineToPoint(ctx, 150, 60);
    
    // 线宽
    CGContextSetLineWidth(ctx, 10);
    
    /*
     kCGLineJoinMiter, 默认
     kCGLineJoinRound, 圆角
     kCGLineJoinBevel 切角
     */
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    // 头尾的样式
    /*
     kCGLineCapButt, // 默认
     kCGLineCapRound, 圆角
     kCGLineCapSquare 线两头加上线宽的一半的宽度
     */
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    // 设置线颜色
    // CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    [[UIColor greenColor] setStroke];
    
    CGContextStrokePath(ctx);
    
}


@end
