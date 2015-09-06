//
//  RCMBarChartCell.m
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RCMBarChartCell.h"
#import "RCMBarShapLayer.h"
#import "UIColor+Extend.h"

@interface RCMBarChartCell()
{
    RCMBarShapLayer *leftShapeLayer;
    RCMBarShapLayer *rightShapeLayer;
    UILabel *itemTitleLabel;
}
@end

@implementation RCMBarChartCell


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self){
        
        self.backgroundColor = [UIColor clearColor];
        
        //创建左侧柱形图的layer
        leftShapeLayer = [[RCMBarShapLayer alloc]init];
        leftShapeLayer.fillColor = [UIColor getColorWithHexColor:LEFT_BAR_COLOR withAlpha:1].CGColor;
        [self.layer addSublayer:leftShapeLayer];
        
        //创建右侧柱形图的layer
        rightShapeLayer = [[RCMBarShapLayer alloc]init];
        rightShapeLayer.fillColor = [UIColor getColorWithHexColor:RIGHT_BAR_COLOR withAlpha:1].CGColor;
        [self.layer addSublayer:rightShapeLayer];
        
        //创建每个柱形图下方的titleLabel
        itemTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, chartViewHight - itemTitleWidth+30, chartCellWidth/3*2, itemTitleWidth)];
        itemTitleLabel.textAlignment = NSTextAlignmentCenter;
        itemTitleLabel.backgroundColor = [UIColor clearColor];
        itemTitleLabel.textColor = [UIColor getColorWithHexColor:TITLE_COLOR withAlpha:1];
        [self.contentView addSubview:itemTitleLabel];
        
    }
    
    return self;
    
}

/*
  根据数据字典初始化柱形图
 @yuegang.wang
 */
-(void)setChartValue:(CGFloat)basic item:(RCMBarChartItemModel *)item withYlineUnitHeight:(CGFloat)height withYLineNumber:(long)yLineNumber
{
    CGFloat basicWidth  = height*yLineNumber;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10,chartViewHight - basicWidth * (item.leftValue / basic) - itemTitleWidth+29.5, chartCellWidth / 3,basicWidth * (item.leftValue / basic))];
    leftShapeLayer.path = path.CGPath;
    leftShapeLayer.bezierPath = path;
    leftShapeLayer.titleLabel.frame = CGRectMake(path.bounds.origin.x, chartViewHight-itemTitleWidth-path.bounds.size.height+11, chartCellWidth/3, 20);
    leftShapeLayer.titleLabel.text = [NSString stringWithFormat:@"%0.2f",item.leftValue];
    
    path = [UIBezierPath bezierPathWithRect:CGRectMake(chartCellWidth/3+10, chartViewHight - basicWidth * (item.rightValue / basic) - itemTitleWidth+29.5, chartCellWidth / 3,basicWidth * (item.rightValue / basic))];
    rightShapeLayer.path = path.CGPath;
    rightShapeLayer.bezierPath = path;
    rightShapeLayer.titleLabel.frame = CGRectMake(path.bounds.origin.x, chartViewHight-itemTitleWidth-path.bounds.size.height+11, chartCellWidth/3, 20);
    rightShapeLayer.titleLabel.text = [NSString stringWithFormat:@"%0.2f",item.rightValue];
    
    //设置每个柱形图的数值
    itemTitleLabel.text = item.title;
    
}



@end
