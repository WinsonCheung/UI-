//
//  ViewController.m
//  29-画板
//
//  Created by winson on 2018/7/13.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"
#import "HMView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HMView *hmView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;


@end

@implementation ViewController

// 清屏
- (IBAction)clear:(id)sender {
    
    [self.hmView clear];
    
}

// 回退
- (IBAction)back:(id)sender {
    [self.hmView back];
}

// 橡皮
- (IBAction)eraser:(id)sender {
    [self.hmView eraser];
    
}

// 保存到相册
-(IBAction)save:(id)sender {
    
    // 1. 开启图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(self.hmView.bounds.size, NO, 0);
    
    // 2. 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3. 截图
    [self.hmView.layer renderInContext:ctx];
    
    // 4. 取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5. 关闭图片类型上下文
    UIGraphicsEndImageContext();
    
    // 6. 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    
}

// 设置线宽
-(IBAction)lineWidthChange:(UISlider *)sender {
    self.hmView.lineWidth = self.slider.value;
}

// 设置线条颜色
-(IBAction)lineColorChange:(UIButton *)sender {
    self.hmView.lineColor = sender.backgroundColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hmView.lineWidth = self.slider.value;
    
    [self lineColorChange:self.firstButton];
}



@end
