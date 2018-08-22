//
//  ViewController.m
//  xx-控制器view的加载方式
//
//  Created by winson on 2018/7/17.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

// 重写控制器的 view
- (void)loadView {
//    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    view.backgroundColor = [UIColor redColor];
//    self.view = view;
    
    NSLog(@"loadView");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    
    // 控制器的view是懒加载的，此时访问self.view,如果重写了loadView，就只会查找laodView，由于loadView中没有设置self.view, 所以会调用 viewDidLoad，viewDidLoad里面有访问self.view，故会造成死循环
    [self.view addSubview:[[UISwitch alloc] init]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
