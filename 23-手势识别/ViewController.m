//
//  ViewController.m
//  23-手势识别
//
//  Created by winson on 2018/7/11.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UITapGestureRecognizer(敲击)

    /*
     @property (nonatomic) NSUInteger  numberOfTapsRequired;  点几次
     @property (nonatomic) NSUInteger  numberOfTouchesRequired 几根手指
     */
    
    // 1. 创建手势对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired = 2;
    // 2. 对某一个 view 添加手势
    [self.imageView addGestureRecognizer:tap];
    // 3. 实现手势的方法
    
    
    
    
    
    // UILongPressGestureRecognizer(长按)
    
    /*
     @property (nonatomic) NSUInteger numberOfTapsRequired;      // Default is 0. The number of full taps required before the press for gesture to be recognized
     @property (nonatomic) NSUInteger numberOfTouchesRequired __TVOS_PROHIBITED;   // Default is 1. Number of fingers that must be held down for the gesture to be recognized
     
     @property (nonatomic) CFTimeInterval minimumPressDuration; // Default is 0.5. Time in seconds the fingers must be held down for the gesture to be recognized
     @property (nonatomic) CGFloat allowableMovement;           // Default is 10. Maximum movement in pixels allowed before the gesture fails. Once recognized (after minimumPressDuration) there is no limit on finger movement for the remainder of the touch tracking
     */
    
    // 1. 创建手势对象
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    longPress.minimumPressDuration = 3; // 长按多长时间有反应
    longPress.allowableMovement = 100;  // 手指移动的误差范围
    
    // 2. 对某一个 view 添加手势
    [self.imageView addGestureRecognizer:longPress];
    
    
    
    
    
    
    
    // UISwipeGestureRecognizer(轻扫)
    // 1. 创建手势对象
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe1.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    // 2. 对某一个 view 添加手势
    [self.imageView addGestureRecognizer:swipe];
    // [self.imageView addGestureRecognizer:swipe1];
    
    
    
    
    
    
    // UIRotationGestureRecognizer（旋转）
    // 1. 创建手势对象
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    // 2. 对某一个 view 添加手势
    [self.imageView addGestureRecognizer:rotation];
    
    
    
    
    
    
    // UIPinchGestureRecognizer(捏合)
    // 1. 创建手势对象
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    // 2. 对某一个 view 添加手势
    [self.imageView addGestureRecognizer:pinch];
    
    
    
    
    
    
    
    // UIPanGestureRecognizer
    // 1. 创建手势对象
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    // 2. 对某一个 view 添加手势
    [self.imageView addGestureRecognizer:pan];
    
}


- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint p = [pan translationInView:pan.view];
    
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, p.x, p.y);
    
    // 恢复初始状态
    [pan setTranslation:CGPointZero inView:pan.view];
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    NSLog(@"%f",pinch.scale);
    
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale, pinch.scale);
    
    // 恢复初始的状态
    pinch.scale = 1;
}

- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    NSLog(@"%f",rotation.rotation);
    
    // self.imageView.transform = CGAffineTransformMakeRotation(rotation.rotation);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
    
    // 恢复初始的状态
    rotation.rotation = 0;
}


-(void)swipe:(UISwipeGestureRecognizer *)swipe {
    
    NSLog(@"%ld", swipe.direction);
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"从右往左");
    }
    
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"从右往左");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"从左往右");
            break;
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"从下往上");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"从上往下");
            break;
    }
}


- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Long Press");
    }
}


- (void)tap:(UITapGestureRecognizer *)tap {
    NSLog(@"你点到我了！");
}


// 解决手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}


@end
