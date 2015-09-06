//
//  RCMBarChartCell.h
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCMBarChartItemModel.h"


#define itemTitleWidth    40
#define chartCellWidth         120
#define chartViewHight          400

#define LEFT_BAR_COLOR @"#bbccdc"
#define RIGHT_BAR_COLOR @"#85be68"
#define TITLE_COLOR @"#3D3935"

/*
 
 柱形图cell封装类
 @yuegang.wang
 
 */

@interface RCMBarChartCell : UICollectionViewCell

@property(nonatomic,assign)CGFloat yLineUnitHeight;//y轴上两个刻度线之间的物理间隔高度（这个跟坐标系创建的时候 相关的，这里是60）
@property(nonatomic,assign)long yLineNumber;//y轴上有多少条刻度区间（注意此处不是刻度线）

/*
 根据模型图的字典 设置柱形图数据
 basic : y轴的最大值
 item:柱形图的数据模型
 height:y轴刻度区间的高度
 yLineNumber：y轴刻度区间数
 @yuegang.wang
 */

-(void)setChartValue:(CGFloat)basic item:(RCMBarChartItemModel *)item withYlineUnitHeight:(CGFloat)height withYLineNumber:(long)yLineNumber;

@end
