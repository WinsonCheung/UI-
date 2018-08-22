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
@property (nonatomic, strong) UIView *blueView;
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
    
    UIView *blueview = [UIView new];
    blueview.frame = CGRectMake(170, [UIScreen mainScreen].bounds.size.height - 50, 50, 50);
    blueview.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueview];
    self.blueView = blueview;
}


// 点击屏幕时调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1. 根据某一个范围 创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 2. 根据某一个动力学元素，创建行为
    // 重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    // 3. 把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    
    // 碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    // 设置边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    
    // 动力学元素自身属性
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.blueView]];
    // 弹力
    //itemBehavior.elasticity = 0.5;
    // 密度
    //itemBehavior.density = 2;
    // 摩擦力
    itemBehavior.friction = 0;
    [self.animator addBehavior:itemBehavior];
    
}

@end
