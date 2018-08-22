//
//  ViewController.m
//  28-转场动画（CATransition）
//
//  Created by winson on 2018/7/12.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) NSInteger imageName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageName = 0;
}
- (IBAction)lingWIdthChange:(UISlider *)sender {
}


- (IBAction)imageChange:(UISwipeGestureRecognizer *)sender {
    
    if (self.imageName == 3) {
        self.imageName = 0;
    }
    self.imageName++;
    
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", self.imageName]];

    // 1. 创建动画
    CATransition *anim = [CATransition new];
    // 2. 操作
    anim.type = @"cube";
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        anim.subtype = kCATransitionFromRight;
    } else if (sender.direction == UISwipeGestureRecognizerDirectionRight){
        anim.subtype = kCATransitionFromLeft;
    }
    // 3. 添加动画
    [self.imageView.layer addAnimation:anim forKey:nil];
}
- (IBAction)changeColor:(UIButton *)sender {
}


@end
