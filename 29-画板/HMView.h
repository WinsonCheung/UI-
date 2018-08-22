//
//  HMView.h
//  29-画板
//
//  Created by winson on 2018/7/13.
//  Copyright © 2018年 winson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMView : UIView

/**
 线宽
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 线条颜色
 */
@property (nonatomic, strong) UIColor *lineColor;


// 清屏
- (void)clear;

// 回退
- (void)back;

// 橡皮
- (void)eraser;

@end
