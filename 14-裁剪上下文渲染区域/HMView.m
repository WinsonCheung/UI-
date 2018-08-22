//
//  HMView.m
//  14-裁剪上下文渲染区域
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
    
    // 1. 获取 image
    UIImage *image = [UIImage imageNamed:@"girl.jpg"];
    
    // 2. 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3. 先画出来显示的区域
    CGContextAddArc(ctx, 150, 150, 150, 0, 2*M_PI, 1);
    
    // 4. 裁剪渲染的区域
    CGContextClip(ctx);
    
    // 5. 把 image 画到裁剪的区域中
    [image drawInRect:rect];
}


@end
