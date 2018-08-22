//
//  BGView.m
//  20-多点触摸事件案例
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "BGView.h"

@implementation BGView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self addSpark:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self addSpark:touches];
    
}

// 添加星星
- (void)addSpark:(NSSet<UITouch *>*)touches {
    
    // 随机获取颜色
    NSInteger color = arc4random() % (self.colors.count-1);
    
    // 遍历触摸事件
    for (UITouch *t in touches) {
        
        // 获取手指的位置
        CGPoint p = [t locationInView:t.view];
        
        // 创建一个 image view
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        
        // 获取颜色
        NSString *colorString = self.colors[color];
        
        // 设置图片与位置
        imageView.image = [UIImage imageNamed:colorString];
        imageView.center = p;
        [self addSubview:imageView];
        
        // 消失动画
        [UIView animateWithDuration:1 animations:^{
            
            imageView.alpha = 0;
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
        color++;
    }
}

@end
