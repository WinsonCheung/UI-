//
//  ViewController.m
//  26-始终练习
//
//  Created by winson on 2018/7/12.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 创建表盘
    CALayer *clock = [[CALayer alloc] init];
    clock.bounds = CGRectMake(0, 0, 200, 200);
    clock.position = CGPointMake(200, 200);
    
    clock.contents = (__bridge id)[UIImage imageNamed:@"clock"].CGImage;
    clock.cornerRadius = 100;
    clock.masksToBounds = YES;
    
    [self.view.layer addSublayer:clock];
    
    
    // 创建秒针
    CALayer *second = [[CALayer alloc] init];
    second.bounds = CGRectMake(0, 0, 2, 100);
    second.position = clock.position;
    second.backgroundColor = [UIColor redColor].CGColor;
    
    // 锚点 （定位点）
    second.anchorPoint = CGPointMake(0.5, 0.8);
    
    [self.view.layer addSublayer:second];
    
    self.second = second;
    
    
    // CADsiplayLink
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    
    // 把 CADsiplayLink 添加到主循环当中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
    
    /*
    // 旋转 一秒钟旋转的角度
    CGFloat angle = 2 * M_PI / 60;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        // 1.
        // second.affineTransform = CGAffineTransformRotate(second.affineTransform, angle);
        
        // 2.
//        NSDate *date = [NSDate date];
//        // 创建时间格式化对象
//        NSDateFormatter *f = [[NSDateFormatter alloc] init];
//        f.dateFormat = @"ss";
//        CGFloat time = [[f stringFromDate:date] floatValue];
//        second.affineTransform = CGAffineTransformMakeRotation(time * angle);
        
        
        // 3. 日历
//        NSCalendar *cal = [NSCalendar currentCalendar];
//        CGFloat time = [cal component:NSCalendarUnitSecond fromDate:[NSDate date]];
//        second.affineTransform = CGAffineTransformMakeRotation(time * angle);
    }];
     */
    
}
- (IBAction)imageChange:(id)sender {
}

- (void)timeChange {
    
    // 旋转 一秒钟旋转的角度
    CGFloat angle = 2 * M_PI / 60;
    NSCalendar *cal = [NSCalendar currentCalendar];
    CGFloat time = [cal component:NSCalendarUnitSecond fromDate:[NSDate date]];
    self.second.affineTransform = CGAffineTransformMakeRotation(time * angle);

    
}



@end
