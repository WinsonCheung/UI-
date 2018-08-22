//
//  BGView.m
//  19-单点触摸事件案例
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "BGView.h"
#import "PinkView.h"

@interface BGView ()

@property (weak, nonatomic) IBOutlet PinkView *pinkView;

@end

@implementation BGView

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *t = touches.anyObject;
    
    CGPoint p = [t locationInView:self];
    CGPoint lastP = [t previousLocationInView:self];
    
    CGFloat offsetX = p.x - lastP.x;
    CGFloat offsetY = p.y - lastP.y;
    
    self.pinkView.center = CGPointMake(self.pinkView.center.x + offsetX, self.pinkView.center.y + offsetY);
}


@end
