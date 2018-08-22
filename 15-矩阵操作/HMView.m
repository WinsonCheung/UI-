//
//  HMView.m
//  15-矩阵操作
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
    
    [self test1];
}



// 绘制图片
- (void)test3:(CGRect)rect {

    UIImage *image = [UIImage imageNamed:@"girl.jpg"];

    // 从某个点开始绘制
    [image drawAtPoint:CGPointMake(50, 50)];

    // 绘制到某一个区域（拉伸）
    [image drawInRect:rect];

    // 平铺
    [image drawAsPatternInRect:rect];
}


// 绘制文字
- (void)test2 {
    // 1. 文字
    NSString *str = @"我把我唱给你听";

    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor redColor];
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowBlurRadius = 5;
    
    // 2. 绘制
    [str drawAtPoint:CGPointMake(50, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                          NSForegroundColorAttributeName:[UIColor blueColor],
                                                          NSBackgroundColorAttributeName:[UIColor whiteColor],
                                                          NSShadowAttributeName:shadow
                                                          }];
}

// 矩阵操作
- (void)test1 {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 备份
    CGContextSaveGState(ctx);
    
    // 矩阵操作
    // 旋转
    // CGContextRotateCTM(ctx, M_PI_4);
    
    // 缩放
    // CGContextScaleCTM(ctx, 0.2, 0.2);
    
    // 平移
    // CGContextTranslateCTM(ctx, 10, 10);
    
    CGContextAddArc(ctx, 150, 150, 100, 0, M_PI * 2, 1);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 300, 300);
    CGContextSetLineWidth(ctx, 10);
    [[UIColor whiteColor] set];
    CGContextStrokePath(ctx);
    
    
    
    
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx, 250, 20);
    
    // 恢复
    CGContextRestoreGState(ctx);
    
    CGContextStrokePath(ctx);
}


@end
