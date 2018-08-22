//
//  ViewController.m
//  30-重力
//
//  Created by winson on 2018/7/16.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    self.redView = view;
}


// 点击屏幕时调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1. 根据某一个范围 创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 2. 根据某一个动力学元素，创建行为
    // 重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    // 方向
    // gravity.angle = M_PI; // 用角度的方式设置方向
    gravity.gravityDirection = CGVectorMake(0, 1); // 用向量的形式设置方向
    gravity.magnitude = 100;
    // 3. 把行为添加到动画者当中
    [self.animator addBehavior:gravity];
}

@end
