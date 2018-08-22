//
//  ViewController.m
//  27-基本动画(CABasicAnimation)
//
//  Created by winson on 2018/7/12.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 50, 50);
    redView.backgroundColor = [UIColor redColor];
    self.layer = redView.layer;
    [self.view addSubview:redView];
    
    /*
     基本动画是属性动画的一种
     核心动画有个特点，动画玩后，会回到原来的位置
     */
    
    /*
     关键帧动画也是属性动画的一种
     */
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 组动画
    // 1. 创建动画
    CAAnimationGroup *group = [CAAnimationGroup new];
    
    // 基本动画（自旋转）
    CABasicAnimation *anim = [CABasicAnimation new];
    anim.keyPath = @"transform.rotation";
    anim.byValue = @(2 * M_PI * 3); // 在自身的基础上增加
    
    // 关键帧动画
    CAKeyframeAnimation *anim1 = [CAKeyframeAnimation new];
    anim1.keyPath = @"position";
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:150 startAngle:0 endAngle:2*M_PI clockwise:1];
    anim1.path = path.CGPath;
    
    // 2. 操作
    group.animations = @[anim, anim1];
    group.repeatCount = INT_MAX;
    group.duration = 3;
    
    // 3. 添加动画
    [self.layer addAnimation:group forKey:nil];
}

// 关键帧动画
- (void)test2 {
    
    // 关键帧动画
    // 1. 做什么动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation new];
    // 2. 怎么做动画
    anim.keyPath = @"position";
    //    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    //    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(150, 100)];
    //    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 150)];
    //    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
    //    anim.values = @[v1,v2,v3,v4]; // 关键的数据
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:150 startAngle:0 endAngle:2*M_PI clockwise:1];
    
    anim.path = path.CGPath;
    anim.duration = 2;
    anim.repeatCount = INT_MAX;
    // 3. 对谁做动画
    [self.layer addAnimation:anim forKey:nil];
}

// 基本动画
- (void)test1 {
    
    // 基本动画
    // 1. 创建动画对象(做什么动画)
    CABasicAnimation *anim = [CABasicAnimation new];
    // 2. 怎么做动画
    anim.keyPath = @"position.x";
    //    anim.fromValue = @(10); // 从哪里到哪里
    //    anim.toValue = @(300);
    anim.byValue = @(10); // 在自身的基础上增加
    // 不希望回到原来的位置
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    
    // 3. 添加动画（对谁做动画）
    [self.layer addAnimation:anim forKey:nil];
    
}

@end
