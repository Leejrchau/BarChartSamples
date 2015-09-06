//
//  RCMBarChartItemModel.h
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 柱形图 每一项的模型类
 @yuegang.wang
 
 */

@interface RCMBarChartItemModel : NSObject

@property(nonatomic,assign)double leftValue;//左侧柱形图的值
@property(nonatomic,assign)double rightValue;//右侧柱形图的值
@property(nonatomic,strong)NSString *title;//item的title

@end
