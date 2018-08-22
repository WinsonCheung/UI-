//
//  HMView.m
//  22-九宫格手势解锁案例
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

#define kButtonCount 9

@interface HMView ()

/**
 9个按钮的数组
 */
@property (nonatomic, strong)NSMutableArray<UIButton *> *buttons;
/**
 所有需要连线的按钮
 */
@property (nonatomic, strong)NSMutableArray *lineButtons;
/**
 当前手指的位置
 */
@property (nonatomic, assign) CGPoint currentPoint;

@end

@implementation HMView

// 画线
-(void)drawRect:(CGRect)rect {
    
    // 如果没有需要画线的按钮，那么不需要执行 frawRect 方法
    if (!self.lineButtons.count) {
        return;
    }
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.lineButtons.count; i++) {
        // 获取 Button
        UIButton *btn = self.lineButtons[i];
        // 如果是第一个按钮 那么设置为起点，其他的直接连线
        if (i == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }
    // 连线到手指的位置
    [path addLineToPoint:self.currentPoint];
    // 设置连接处的样式
    [path setLineJoinStyle:kCGLineJoinRound];
    // 设置头尾的样式
    [path setLineCapStyle:kCGLineCapRound];
    // 设置颜色、线宽
    [[UIColor yellowColor] set];
    path.lineWidth = 10;
    // 渲染
    [path stroke];
}

// 无论是从 sb 或者 xib 都会调用
// 手指点击的时候调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取触摸对象
    UITouch *t = touches.anyObject;
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    for (int i = 0; i<self.buttons.count; i++) {
        // 获取button
        UIButton *btn = self.buttons[i];
        // 如果 btn 的 frame 包含 手指的点
        if (CGRectContainsPoint(btn.frame, p)) {
            btn.selected = YES;
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取触摸对象
    UITouch *t = touches.anyObject;
    // 获取手指的位置
    CGPoint p = [t locationInView:t.view];
    // 赋值给全局属性
    self.currentPoint = p;
    for (int i = 0; i<self.buttons.count; i++) {
        // 获取button
        UIButton *btn = self.buttons[i];
        // 如果 btn 的 frame 包含 手指的点
        if (CGRectContainsPoint(btn.frame, p)) {
            btn.selected = YES;
            // 判断 如果已经加到了数组当中 那么不再去添加
            if (![self.lineButtons containsObject:btn]) {
                // 添加到需要画线的数组当中
                [self.lineButtons addObject:btn];
            }
        }
    }
    // 重绘
    [self setNeedsDisplay];
}

// 手指离开这个 view 的时候调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 修改最后手指的位置为需要连线的最后一个按钮的中心，解决最后一根线多出来的问题
    self.currentPoint = [self.lineButtons.lastObject center];
    // 重绘
    [self setNeedsDisplay];
    for (int i = 0; i < self.lineButtons.count; i++) {
        // 获取 Button
        UIButton *btn = self.lineButtons[i];
        // 让 btn 变成错误的状态的同时 需要取消选中状态
        btn.selected = NO;
        // 让 btn 变成错误的样式（不可用状态）
        btn.enabled = NO;
    }
    // 拼接密码
    NSString *password = @"";
    for (int i = 0; i < self.lineButtons.count; i++) {
        // 获取 Button
        UIButton *btn = self.lineButtons[i];
        password = [password stringByAppendingString:[NSString stringWithFormat:@"%ld", btn.tag]];
    }
    if (self.passwordBlock) {
        if(self.passwordBlock(password)) {
            NSLog(@"正确！");
        } else {
            NSLog(@"错误！");
        }
    }
    // 关闭用户交互
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 开启用户交互
        self.userInteractionEnabled = YES;
        // 清空
        [self clear];
    });
}

// 清空 （恢复到最初始的状态）
- (void)clear {
    for (int i = 0; i < self.buttons.count; i++) {
        // 获取 Button
        UIButton *btn = self.buttons[i];
        // 取消按钮的高亮状态（选中状态）
        btn.selected = NO;
        // 让按钮取消错误的样式 （可用状态）
        btn.enabled = YES;
    }    // 清空所有的线
    [self.lineButtons removeAllObjects];
    // 重绘
    [self setNeedsDisplay];
}

// 布局九宫格
-(void)layoutSubviews {
    [super layoutSubviews];
    // 计算九宫格
    CGFloat w = 74,h = w;
    int colCount = 3;
    CGFloat margin = (self.frame.size.width - 3 * w) / 4;
    for (int i = 0; i<self.buttons.count; i++) {
        CGFloat x = (i % colCount) * (margin + w) + margin;
        CGFloat y = (i / colCount) * (margin + w) + margin;
        [self.buttons[i] setFrame:CGRectMake(x, y, w, h)];
    }
}
// 懒加载
-(NSMutableArray<UIButton *> *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
        for (int i = 0; i<kButtonCount; i++) {
            UIButton *btn = [[UIButton alloc] init];
            btn.tag = i;
            // 设置默认的图片
            [btn setBackgroundImage:[UIImage imageNamed:@"g_normal"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"g_click"] forState:UIControlStateSelected];
            // 设置 btn 错误的图片 （可用状态）
            [btn setBackgroundImage:[UIImage imageNamed:@"g_wrong"] forState:UIControlStateDisabled];
            [btn setUserInteractionEnabled:NO];
            [self addSubview:btn];
            [_buttons addObject:btn];
        }
    }
    return _buttons;
}

-(NSMutableArray *)lineButtons {
    if (!_lineButtons) {
        _lineButtons = [NSMutableArray array];
    }
    return _lineButtons;
}

@end
