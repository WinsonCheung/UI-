//
//  HMView.m
//  18-触摸事件
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@implementation HMView

// 手指按下的时触发
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //  NSLog(@"%s",__func__);
    
    // 获取参数
    UITouch *t = touches.anyObject;
    
    // 获取当前点的位置
    CGPoint p = [t locationInView:self.superview];
    
    // 当 view当前的位置等于手指的位置
    self.center = p;
    
    
    
    /*
     // 快速点击的次数
     NSLog(@"快速点击的次数：%ld",t.tapCount);
     
     // 点击的阶段
     NSLog(@"点击的阶段：%ld", t.phase);
     
     // 触摸对象所在的窗口
     NSLog(@"触摸事件所在的窗口：%@", t.window);
     
     // view 所在的窗口
     NSLog(@"view所在的窗口：%@", self.window);
     
     // 主窗口
     NSLog(@"主窗口：%@", [UIApplication sharedApplication].keyWindow);
     
     // 触摸事件所在的 view
     NSLog(@"触摸事件所在的view:%@", t.view);
     
     // self
     NSLog(@"self:%@",self);
     
     
     // 以哪个 view 为坐标系 返回所在的位置
     CGPoint p = [t locationInView:self.superview];
     NSLog(@"%@", NSStringFromCGPoint(p));
     */
}
// 手指移动时触发
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取参数
    UITouch *t = touches.anyObject;
    
    // 获取当前的位置
    CGPoint p = [t locationInView:self.superview];
    
    // 获取上一个点的位置
    CGPoint lastP = [t previousLocationInView:self.superview];
    
    // 计算偏移量
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    
    
    // 让 view 的中心 等于手指最新的位置
    //self.center = p;
    
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    
    /*
     NSLog(@"%s",__func__);
     UITouch *t = touches.anyObject;
     
     // 当前点点的位置
     CGPoint p = [t locationInView:self];
     
     // 上一个点的位置
     CGPoint lastP = [t preciseLocationInView:self];
     NSLog(@"当前点：%@", NSStringFromCGPoint(p));
     NSLog(@"上一个点的位置：%@", NSStringFromCGPoint(lastP));
     */
}
// 手指抬起时触发
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // NSLog(@"%s",__func__);
}
// 意外事件中断时触发
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // NSLog(@"%s",__func__);
}


@end
