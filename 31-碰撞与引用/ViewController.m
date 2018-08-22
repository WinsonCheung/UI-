//
//  ViewController.m
//  31-碰撞与引用
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
    
    UIView *blueView = [UIView new];
    blueView.frame = CGRectMake(170, [UIScreen mainScreen].bounds.size.height - 50, 50, 50);
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    self.blueView = blueView;
}


// 点击屏幕时调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1. 根据某一个范围 创建动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 2. 根据某一个动力学元素，创建行为
    // 重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    
    // 碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.blueView]];
    // 把引用 view 的 bounds变成边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    /*
     typedef NS_OPTIONS(NSUInteger, UICollisionBehaviorMode) {
     UICollisionBehaviorModeItems         // 仅仅 item 和 item 之间发生碰撞
     UICollisionBehaviorModeBoundaries    // 仅仅是和边界发生碰撞
     UICollisionBehaviorModeEverything    // item 和边界都放生碰撞
     } NS_ENUM_AVAILABLE_IOS(7_0);
     */
    
    collision.collisionMode = UICollisionBehaviorModeEverything;
    
    // 3. 把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}


@end
