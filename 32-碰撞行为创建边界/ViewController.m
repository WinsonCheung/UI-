//
//  ViewController.m
//  32-碰撞行为创建边界
//
//  Created by winson on 2018/7/16.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface BGView:UIView

@property (nonatomic, assign) CGRect redViewRect;

@end

@implementation BGView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 200)];
    [path addLineToPoint:CGPointMake(200, 250)];
    [path stroke];
    [[UIBezierPath bezierPathWithRect:self.redViewRect] stroke];
    
}

@end

@interface ViewController () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIDynamicAnimator *animator;


@end

@implementation ViewController

- (void)loadView {
    self.view = [[BGView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

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
    
    // 添加边界
    // 以一条线为边界
    [collision addBoundaryWithIdentifier:@"key" fromPoint:CGPointMake(0, 200) toPoint:CGPointMake(200, 250)];
    
    // 以一个路径为边界
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.blueView.frame];
//    [collision addBoundaryWithIdentifier:@"key" forPath:path];
    
    // collision action
    collision.action = ^{
      
        BGView *view = (BGView *)self.view;
        view.redViewRect = self.redView.frame;
        [self.view setNeedsDisplay];
        
        // 如果 宽大于 105 变色
        if (self.redView.frame.size.width > 105) {
            self.redView.backgroundColor = [UIColor yellowColor];
        } else {
            self.redView.backgroundColor = [UIColor blueColor];
        }
    };
    
    // 设置代理
    collision.collisionDelegate = self;
    
    // 3. 把行为添加到动画者当中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p{
    
    // 需要强转 进行判断
    NSString *str = (NSString *)identifier;
    if ([str isEqualToString:@"key"]) {
        self.redView.backgroundColor = [UIColor yellowColor];
    } else {
        self.redView.backgroundColor = [UIColor blueColor];
    }
    
}


@end
