//
//  ViewController.m
//  24-CALayer基本属性
//
//  Created by winson on 2018/7/11.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *redView = [UIView new];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    
    redView.layer.borderWidth = 10;
    redView.layer.borderColor = [UIColor grayColor].CGColor;
    
    redView.layer.shadowOffset = CGSizeZero;
    redView.layer.shadowColor = [UIColor blueColor].CGColor;
    redView.layer.shadowRadius = 50;
    redView.layer.shadowOpacity = 1;
    
    redView.layer.cornerRadius = 50;
    redView.layer.masksToBounds = YES; // 裁剪超出layer范围的东西
    
    // redView.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    // 默认情况下，center跑到position的位置上
   //  redView.layer.position = CGPointMake(0, 0);
    
    // 设置内容
    redView.layer.contents = (__bridge id)[UIImage imageNamed:@"girl.jpg"].CGImage;
    
    [self.view addSubview:redView];
}
- (IBAction)imageChange:(id)sender {
}
- (IBAction)imageChange:(id)sender {
}
- (IBAction)imageChange:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
