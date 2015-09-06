//
//  RCMBarShapLayer.h
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

/*
 
 柱形图shapLayer自定义子类
 @yuegang.wang
 
 */
@interface RCMBarShapLayer : CAShapeLayer

@property(nonatomic,strong)UIBezierPath *bezierPath;
@property(nonatomic,strong)UILabel *titleLabel;//显示在柱形图上方的数据标签

@end
