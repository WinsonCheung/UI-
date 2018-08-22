//
//  ViewController.m
//  13-饼图封装
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "HMView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HMView *pieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)imageChange:(UISwipeGestureRecognizer *)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)valueChanged:(UISlider *)sender {
    
    self.pieView.rate = sender.value;
    
    NSLog(@"%f", sender.value);
}


@end
