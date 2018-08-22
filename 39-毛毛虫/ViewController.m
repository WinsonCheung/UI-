//
//  ViewController.m
//  39-毛毛虫
//
//  Created by winson on 2018/7/16.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attach;
@property (nonatomic, strong) NSMutableArray *bodys;

@end


@implementation ViewController

- (NSMutableArray *)bodys {
    if (!_bodys) {
        _bodys = [NSMutableArray array];
    }
    return _bodys;
}

- (UIDynamicAnimator *)animator {
    
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    for(int i = 0; i<9; i++) {
        UIView *wormView = [UIView new];
        CGFloat w = 30;
        CGFloat h = 30;
        CGFloat x = i*w;
        CGFloat y = 100;
        wormView.frame = CGRectMake(x, y, w, h);
        wormView.backgroundColor = [UIColor redColor];
        
        // 把所有的 view 切成圆角
        wormView.layer.cornerRadius = w * 0.5;
        wormView.layer.masksToBounds = YES;
        
        if (i == 8) {
            wormView.frame = CGRectMake(x, y - h*0.5, w*2, h*2);
            wormView.backgroundColor = [UIColor blueColor];
            wormView.layer.cornerRadius = w;
            wormView.layer.masksToBounds = YES;
            
            // 添加一个拖拽的手势
            UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            [wormView addGestureRecognizer:pan];
        }
        
        [self.view addSubview:wormView];
        [self.bodys addObject:wormView];
    }
    
    for (int i = 0; i<self.bodys.count-1; i++) {
        // 附着
        UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc] initWithItem:self.bodys[i] attachedToItem:self.bodys[i+1]];
        [self.animator addBehavior:attach];
    }
    
    // 碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:self.bodys];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    
    // 重力
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:self.bodys];
    [self.animator addBehavior:gravity];
}

// 3. 实现拖拽手势的方法
- (void)pan:(UIPanGestureRecognizer *)sender {
    // 获取手指的位置
    CGPoint p = [sender locationInView:self.view];
    // 2. 创建行为
    if (!self.attach) {
        UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc] initWithItem:sender.view attachedToAnchor:p];
        self.attach = attach;
    }
    self.attach.anchorPoint = p;
    // 3. 把行为添加到动画者对象当中
    [self.animator addBehavior:self.attach];
    
    
    // 撒手的时候 移除手指和头的附着行为
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.attach];
    }
    
}


@end
