//
//  ViewController.m
//  34-附着行为-刚性附着
//
//  Created by winson on 2018/7/16.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface BGVIew:UIView

@property (nonatomic, assign) CGPoint start;
@property (nonatomic, assign) CGPoint end;

@end

@implementation BGVIew

-(void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.start];
    [path addLineToPoint:self.end];
    [path stroke];
}

@end

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attach;

@end

@implementation ViewController


- (void)loadView {
    self.view = [[BGVIew alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor redColor];
    view.alpha = 0.6;
    [self.view addSubview:view];
    self.redView = view;
    
    UIView *bview = [UIView new];
    bview.frame = CGRectMake(300, 100, 100, 100);
    bview.backgroundColor = [UIColor blueColor];
    bview.alpha = 0.6;
    [self.view addSubview:bview];
    self.blueView= bview;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 获取触摸对象
    UITouch *t = touches.anyObject;
    // 获取手指位置
    CGPoint p = [t locationInView:t.view];
    
    // 1. 动画者对象
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 2. 创建行为
    UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc] initWithItem:self.redView offsetFromCenter:UIOffsetMake(20, 20) attachedToAnchor:p];
    // 3. 把行为添加到动画者当中
    [self.animator addBehavior:attach];
    self.attach = attach;
    // 重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    [self.animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取触摸对象
    UITouch *t = touches.anyObject;
    // 获取手指位置
    CGPoint p = [t locationInView:t.view];

    self.attach.anchorPoint = p;

    // 弹性附着
    // self.attach.damping = 0.5; // 减幅
    // self.attach.frequency = 0.5; // 频率 赫兹

    __weak typeof(self) weakSelf = self;
    self.attach.action = ^{
        BGVIew *bgView = (BGVIew *)weakSelf.view;
        bgView.start = weakSelf.redView.center;
        bgView.end = p;
        [bgView setNeedsDisplay];
    };
}



@end
