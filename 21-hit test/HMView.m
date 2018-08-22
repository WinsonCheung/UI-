//
//  HMView.m
//  21-hit test
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "HMView.h"

@implementation HMView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"pink = touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"pink = hit test");
    
    return [super hitTest:point withEvent:event];
}

@end
