//
//  HMView.h
//  22-九宫格手势解锁案例
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMView : UIView

@property(nonatomic, copy) BOOL(^passwordBlock)(NSString *);

@end
