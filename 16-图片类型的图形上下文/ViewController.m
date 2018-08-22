//
//  ViewController.m
//  16-图片类型的图形上下文
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [self addCircleWithImage:[UIImage imageNamed:@"girl.jpg"] color:[UIColor whiteColor] width:15];
    
}

-(UIImage *)addCircleWithImage:(UIImage *)image color:(UIColor *)color width:(CGFloat)width {
    
    
    CGSize ctxSize = CGSizeMake(image.size.width + 2 * width, image.size.height + 2 * width);
    
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, 0);
    
    // 获取绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint arcCenter = CGPointMake(ctxSize.width * 0.5, ctxSize.height * 0.5);
    CGFloat radius = image.size.width * 0.5 + width * 0.5;
    
    // 画外圆
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, radius, 0, M_PI * 2, 1);
    
    // 设置线宽
    CGContextSetLineWidth(ctx, width);
    
    // 设置颜色
    [color set];
    
    // 绘制
    CGContextStrokePath(ctx);
    
    // 画内圆
    CGContextAddArc(ctx, arcCenter.x, arcCenter.y, image.size.width * 0.5, 0, 2 * M_PI, 1);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [image drawAtPoint:CGPointMake(10, 10)];
    
    // 保存图片
    UIImage *circelImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 保存图片到相册中
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
    
    // 关闭 图片上下文
    UIGraphicsEndImageContext();
    
    return circelImage;
}


/*
 -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
 
 UIImage *image = [UIImage imageNamed:@"zongzi.png"];
 
 // 开启图片类型的图形上下文
 // UIGraphicsBeginImageContext(CGSizeMake(300, 300));
 
 UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 300), NO, 0);
 
 // 获取当前的上下文
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 
 // 拼接路径 同时 把路径添加到上下文当中
 CGContextAddArc(ctx, image.size.width * 0.5, image.size.height * 0.5, image.size.width * 0.5, 0, M_PI * 2, 1);
 
 // 裁剪
 CGContextClip(ctx);
 
 [image drawAtPoint:CGPointZero];
 
 UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
 
 // 关闭图片类型的图形上下文
 UIGraphicsEndImageContext();
 
 self.imageView.image = newImage;
 
 // 保存到相册
 UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
 
 
 
 
 
 //     渲染
 //     CGContextFillPath(ctx);
 //
 //
 //    // 通过图片类型的图形上下文 获取图片对象
 //    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
 //
 //
 //    // 1. 先把image对象转化成 NSData
 //    NSData *data = UIImagePNGRepresentation(img);
 //
 //    // 2. 通过data 的 writeToFile 写入到沙盒中
 //    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
 //
 //    NSString *filePath = [path stringByAppendingPathComponent:@"1.png"];
 //
 //    [data writeToFile:filePath atomically:YES];
 }
 
 
 // 保存到相册的回调
 - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
 NSLog(@"保存完成");
 }
 */



@end
