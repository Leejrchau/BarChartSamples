//
//  RCMBarShapLayer.m
//  RenaultCarMaintenance
//
//  Created by apple on 15/7/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "RCMBarShapLayer.h"

@implementation RCMBarShapLayer

-(id)init
{
    self = [super init];
    if(self){
        
        UILabel *label = [[UILabel alloc]initWithFrame:self.bezierPath.bounds];
        label.backgroundColor = [UIColor clearColor];
        self.titleLabel = label;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        [self addSublayer:label.layer];
        
    }
    
    return self;
    
}

@end
