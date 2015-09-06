//
//  ViewController.m
//  BarChartSamples
//
//  Created by apple on 15/7/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "RCMBarChartView.h"
#import "RCMBarChartCoordinateView.h"
#import "RCMBarChartItemModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet RCMBarChartView *barChartView;
@property (weak, nonatomic) IBOutlet RCMBarChartCoordinateView *coorDinateView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //计算y轴的最大值
    long maxValue = [self getMultipleOfNumber:6 withMaxValue:30];
    
    //设置数据统计坐标系的y轴最大值
    self.coorDinateView.maxValueYLine = maxValue;
    //设置坐标系y轴上的每个刻度区间的高度
    self.coorDinateView.yLineUnitHeight = 60;
    //设置坐标系y轴上有多少个刻度区间
    self.coorDinateView.yLineNumber = 6;
    
    //绘画柱形图
    [self drawBarChartViewWithMaxValue:maxValue withYLineNumber:6 withYLineUnitHeight:60 withDataArray:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)drawBarChartViewWithMaxValue:(long)maxValue withYLineNumber:(long)yLineNumber withYLineUnitHeight:(float)height withDataArray:(NSArray *)dataArray
{
    
        NSMutableArray* arr = [NSMutableArray array];
        
        for(int i = 10;i >=0;i--)
        {
            RCMBarChartItemModel* item = [[RCMBarChartItemModel alloc]init];
            item.title = [NSString stringWithFormat:@"3-%d",i];
            item.leftValue = arc4random() % 30;
            item.rightValue = arc4random() % 30;
            [arr addObject:item];
        }
        
        self.barChartView.maxValue = maxValue;
        self.barChartView.yLineNumber = yLineNumber;
        self.barChartView.yLineUnitHeight = height;
        self.barChartView.dataSource = arr;
            
}

//获取一个数的刻度数的倍数
-(long)getMultipleOfNumber:(long)number withMaxValue:(long)maxValue
{
    if(maxValue%number==0){
        
        return maxValue;
        
    }else{
        
        return (maxValue/number+1)*number;
        
    }
    
    return maxValue;
}

@end
