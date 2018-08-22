//
//  ViewController.m
//  17-屏幕截图
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 开启图片上线文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    // 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 屏幕截图
    [self.view.layer renderInContext:ctx];
    
    // 获取图片
    UIImage *imge = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片上下文
    UIGraphicsEndImageContext();
    
    // 保存图片
    UIImageWriteToSavedPhotosAlbum(imge, NULL, NULL, NULL);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
