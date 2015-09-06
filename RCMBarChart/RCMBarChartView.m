//
//  RCMBarChartView.m
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RCMBarChartView.h"
#import "RCMBarChartCell.h"
#import "RCMBarChartItemModel.h"


@interface RCMBarChartView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *charCollectionView;
}

@end

@implementation RCMBarChartView


-(void)drawRect:(CGRect)rect
{
    [self initChartViewUIWithFrame:self.frame];
}


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){

        [self initChartViewUIWithFrame:frame];
    }
    return self;
}

/*
 初始化柱形图视图UI
 @yuegang.wang
 */
-(void)initChartViewUIWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
     UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), frame.size.height) collectionViewLayout:layout];
    charCollectionView = collectionView;
    charCollectionView.backgroundColor = [UIColor clearColor];
    charCollectionView.delegate = self;
    [charCollectionView registerClass:[RCMBarChartCell class] forCellWithReuseIdentifier:@"cell"];
    charCollectionView.dataSource = self;
    charCollectionView.showsVerticalScrollIndicator = NO;
    [self addSubview:charCollectionView];
    
}


#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSource.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RCMBarChartCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    RCMBarChartItemModel* item = [self.dataSource objectAtIndex:indexPath.section];
    [cell setChartValue:self.maxValue item:item withYlineUnitHeight:self.yLineUnitHeight withYLineNumber:self.yLineNumber];
    return cell;
    
}


/*
 设置这里的cell的宽度 可以设置每一对柱形图之间的间距
 @yuegang.wang
 */
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, CGRectGetHeight(self.frame));
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(1, CGRectGetHeight(self.frame));
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(1, CGRectGetHeight(self.frame));
    
}

#pragma mark - 刷新数据

/*
 @yuegang.wang
 */
-(void)reloadData
{
    [charCollectionView reloadData];
}



@end
