//
//  ViewController.m
//  37-推行为
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

    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redView = redView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:t.view];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    /*
     UIPushBehaviorModeContinuous, // 持续推力（越来越快）
     UIPushBehaviorModeInstantaneous // 瞬时推力（越来越慢）
     */
    
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.redView] mode:UIPushBehaviorModeContinuous];
    
    // 量级
    push.magnitude = 0.1;
    
    // 方向
    // push.angle = M_PI;
    // 计算偏移量
    CGFloat offsetX = (p.x - self.redView.center.x) / 100;
    CGFloat offsetY = (p.y - self.redView.center.y) / 100;
    push.pushDirection = CGVectorMake(offsetX, offsetY);
    
    [self.animator addBehavior:push];
}


@end
