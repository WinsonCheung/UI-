//
//  ViewController.m
//  20-多点触摸事件案例
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "BGView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet BGView *bgView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *colors = @[@"blue",@"red",@"yellow"];
    self.bgView.colors = colors;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
