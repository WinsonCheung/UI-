//
//  HMView.m
//  12-柱状图
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@implementation HMView

+ (instancetype)view {
    UINib *nib = [UINib nibWithNibName:@"HMView" bundle:nil];
    HMView *view = [nib instantiateWithOwner:nil options:nil][0];
    return view;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    for (int i = 0; i<self.values.count; i++) {
        
        // 计算 rect
        CGFloat width = 20;
        CGFloat height = [self.values[i] floatValue] * rect.size.height;
        CGFloat x = i * 2 * width;
        CGFloat y = rect.size.height - height;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect: CGRectMake(x, y, width, height)];
        
        [[UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1] set];
        
        [path fill];
    }
}


@end
