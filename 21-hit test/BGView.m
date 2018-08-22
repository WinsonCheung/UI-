//
//  BGView.m
//  21-hit test
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "BGView.h"

@implementation BGView

/*
 2018-07-10 14:49:32.908620+0800 21-hit test[5769:393820] BGView = hit test
 2018-07-10 14:49:32.909159+0800 21-hit test[5769:393820] pink = hit test
 2018-07-10 14:49:32.911409+0800 21-hit test[5769:393820] pink = touchesBegan
 2018-07-10 14:49:32.911675+0800 21-hit test[5769:393820] BGView = touchesBegan
 */

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"BGView = touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"BGView = hit test");
    
    return [super hitTest:point withEvent:event];
}
/*
// 模拟 hit test 内部实现
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"%@---hit test",[self class]);
    
    // 如果控件不允许与用户交互 那么返回 nil
    if(self.userInteractionEnabled == NO || self.alpha <= 0.01 || self.hidden == YES) {
        return nil;
    }
    
    // 如果这个点不在当前控件中 那么返回 nil
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    // 从后向前遍历每一个子控件
    for (int i = (int)self.subviews.count - 1; i>= 0; i--) {
        
        // 获取一个子控件
        UIView *lastView = self.subviews[i];
        
        // 把当前触摸点坐标转换为相对于子控件的触摸点坐标
        CGPoint subPoint = [self convertPoint:point toView:lastView];
        
        // 判断是否在子控件中找到了更合适的子控件
        UIView *nextView = [lastView hitTest:subPoint withEvent:event];
        
        // 如果找到了返回
        if(nextView) {
            return nextView;
        }
    }
    
    // 如果以上都没有执行 return，那么返回自己（表示子控件中没有“更合适”的了）
    return self;
}
 */

@end
