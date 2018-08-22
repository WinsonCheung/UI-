//
//  ViewController.m
//  11-饼图
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "HMView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HMView *pieView = [HMView pieView];
    pieView.values = @[@0.1, @0.3, @0.2, @0.4];
    pieView.frame = CGRectMake(0, 0, 200, 200);
    pieView.center = self.view.center;
    [self.view addSubview:pieView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
