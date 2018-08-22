//
//  HMView.m
//  13-饼图封装
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@interface HMView ()

@property (nonatomic, weak) IBOutlet UILabel *label;

@end

@implementation HMView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
                                                        radius:100
                                                    startAngle:-M_PI_2
                                                      endAngle:2 * M_PI *self.rate - M_PI_2
                                                     clockwise:1];
    [path addLineToPoint:CGPointMake(150, 150)];
    
    [[UIColor whiteColor] set];
    
    // 填充
    [path fill];
}

- (void)setRate:(CGFloat)rate {
    
    _rate = rate;
    
    _label.text = [NSString stringWithFormat:@"%.2f%%",rate * 100];
    
    [self setNeedsDisplay];
}


@end
