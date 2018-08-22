//
//  HMView.m
//  29-画板
//
//  Created by winson on 2018/7/13.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"
#import "HMBezierPath.h"

@interface HMView ()

@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation HMView

-(NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

// 手指在这个 view 上触摸的时候调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取触摸对象
    UITouch *t = touches.anyObject;
    
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    
    // 起点
    HMBezierPath *path = [[HMBezierPath alloc] init];
    
    // 保存颜色
    [path setLineColor:self.lineColor];

    // 设置线宽
    [path setLineWidth:self.lineWidth];
    
    [path moveToPoint:p];
    
    // 添加到路径数组
    [self.paths addObject:path];

}

// 手指在这个 view 上移动的时候调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取触摸对象
    UITouch *t = touches.anyObject;
    
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    
    // 连线
    [self.paths.lastObject addLineToPoint:p];
    
    // 重绘
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    
    
    for (HMBezierPath *path in self.paths) {
        
        // 设置连接处样式
        [path setLineJoinStyle:kCGLineJoinRound];
        [path.lineColor set];
        
        // 设置头尾样式
        [path setLineCapStyle:kCGLineCapRound];
        
        // 渲染
        [path stroke];
    }
}

// 清屏
- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
    
}

// 回退
- (void)back {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
    
}

// 橡皮
- (void)eraser {
    self.lineColor = self.backgroundColor;
    
}


@end
