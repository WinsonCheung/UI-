//
//  ViewController.m
//  22-九宫格手势解锁案例
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "HMView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet HMView *gView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"home_bg"]];
    
    // 密码
    NSString *str = @"012";
    self.gView.passwordBlock = ^(NSString *pwd) {
        if ([pwd isEqual:str]) {
            return YES;
        } else {
            return NO;
        }
    };
}

@end
