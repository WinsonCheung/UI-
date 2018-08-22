//
//  ViewController.m
//  25-手动创建CALayer
//
//  Created by winson on 2018/7/12.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor; // 颜色
    layer.position = CGPointMake(200, 200);
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.contents = (__bridge id)[UIImage imageNamed:@"girl"].CGImage;

    [self.view.layer addSublayer:layer];
    self.layer = layer;

    
    
    
    
    
//    // 手动创建CALayer
//    CALayer *layer = [[CALayer alloc] init];
//    layer.backgroundColor = [UIColor redColor].CGColor; // 颜色
//    layer.position = CGPointMake(200, 200);
//    layer.bounds = CGRectMake(0, 0, 100, 100);
//    [self.view.layer addSublayer:layer];
//    self.layer = layer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    // 平移
    self.layer.transform = CATransform3DTranslate(self.layer.transform, 0, 10, 0);
    
    
    // 缩放(Z轴式无效的)
    // self.layer.transform = CATransform3DScale(self.layer.transform, 1, 1, 0.5);
    
    
    // 旋转
    // self.layer.transform = CATransform3DRotate(self.layer.transform, M_PI_4, 0, 1, 1);
    
    
    
    
//        // 获取触摸对象
//        UITouch *t = touches.anyObject;
//        // 获取手指当前的位置
//        CGPoint p = [t locationInView:t.view];
//        self.layer.position = p;
    
    
    // self.layer.opacity = self.layer.opacity == 0 ? 1:0;
    
    
//    // 禁用隐式动画（事务）
//    [CATransaction begin]; // 开启事务
//    [CATransaction setDisableActions:YES]; // 禁用隐式动画
//
//    self.layer.bounds = CGRectMake(0, 0, 200, 200);
//
//    [CATransaction commit]; // 提交事务
    
    
//    // 获取触摸对象
//    UITouch *t = touches.anyObject;
//    // 获取手指当前的位置
//    CGPoint p = [t locationInView:t.view];
//    self.layer.position = p;
    
}

@end
