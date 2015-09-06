//
//  UIColor+Extend.h
//  RenaultCarMaintenance
//
//  Created by apple on 15/6/24.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 颜色扩展类别
  @yuegang.wang
 */
@interface UIColor (Extend)

/*
 根据给定的二进制颜色值生成UIColor＊
 hexString ：二进制色值
 alpha：透明度
 @yuegang.wang
 */

+(UIColor *)getColorWithHexColor:(NSString * )hexString withAlpha:(CGFloat)alpha;

@end
