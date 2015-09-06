//
//  RCMBarChartCoordinateView.m
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RCMBarChartCoordinateView.h"


#define kZMCCoordinateXHeight 646
#define kZMCCoordinateYHeight 360
#define kZMCCoordinateSignWidth 646
#define kZMCCoordinateOrigin CGPointMake(40, 370)
#define kCoordinateDistanceX 26
#define kCoordinateDistanceY 50

@implementation RCMBarChartCoordinateView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    for (id subView in [self subviews]) {
        
        [subView removeFromSuperview];
    
    }
    
    //创建坐标系
    [self drawBarCoordinate:kZMCCoordinateOrigin];
    
    CGFloat distanceY = self.yLineUnitHeight;//y坐标轴上间隔的物理像素高度（60）
    // 画出y轴的数据
    for (int i = 0; i <=self.yLineNumber; i ++) {
        CGRect yRect = CGRectMake(kZMCCoordinateOrigin.x - 38, (kZMCCoordinateOrigin.y - i * distanceY) - 10, 36, 20);
        NSString *y = [NSString stringWithFormat:@"%0.0f", i * self.maxValueYLine/self.yLineNumber];
        UILabel *label = [[UILabel alloc] initWithFrame:yRect];
        label.text = y;
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor  clearColor];
        [label setFont:[UIFont systemFontOfSize:18]];
        [self addSubview:label];
        
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(kZMCCoordinateOrigin.x-40, kZMCCoordinateOrigin.y+10, 40, 20)];
    label.text = @"(万元)";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [label setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:label];
    
}


#pragma mark - 绘画坐标轴

- (void)drawBarCoordinate:(CGPoint)point
{
    //获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 画y轴
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    CGContextMoveToPoint(context, point.x, point.y);
    CGContextAddLineToPoint(context, point.x, point.y - kZMCCoordinateYHeight);
    
    //画x轴
    CGContextMoveToPoint(context, point.x, point.y);
    CGContextAddLineToPoint(context, point.x + kZMCCoordinateXHeight, point.y);
    CGContextStrokePath(context);
    
    //画封顶线
    CGContextMoveToPoint(context, point.x, point.y - kZMCCoordinateYHeight);
    CGContextAddLineToPoint(context, point.x + kZMCCoordinateXHeight, point.y - kZMCCoordinateYHeight);
    CGContextStrokePath(context);

    // 画y轴显示的标记
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    //CGContextSetLineWidth(context, 1);
    CGFloat distance = self.yLineUnitHeight;
    
    CGContextSetLineWidth(context, 0.3f);
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    for (int i = 1; i < self.yLineNumber; i ++) {
        
        CGContextSetLineWidth(context, 0.30f);//设置线条的粗细
        CGContextMoveToPoint(context, point.x, point.y - distance * i);
        CGContextAddLineToPoint(context, point.x + kZMCCoordinateSignWidth, point.y - distance * i);
    }
    CGContextStrokePath(context);
}


#pragma mark - 获取y坐标轴上的最大值

-(float)getMaxNumberYLine:(NSArray *)array
{
    float max = 0;
    for (NSArray *a in array) {
        for (NSString *str in a) {
            float a = [str floatValue];
            if (a > max) {
                max = a;
            }
        }
    }
    if (max <= 10) {
        max = 10;
    }
    else if (max <= 100) {
        max = 100;
    }
    else {
        max = ((int)max)/100 * 100 + 100;
    }
    return max;

}


@end
