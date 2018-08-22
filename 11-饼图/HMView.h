//
//  HMView.h
//  11-饼图
//
//  Created by winson on 2018/7/10.
//  Copyright © 2018年 winson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMView : UIView

@property (nonatomic, strong) NSArray* values;

+ (instancetype)pieView;

@end
