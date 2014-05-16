//
//  NSArray+Histgram.m
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/16.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "NSArray+Histgram.h"

@implementation NSArray (Histgram)

- (NSArray *)histgramArray
{
    NSUInteger maximumNumberForNumbers = 0;
    
    for (NSNumber *number in self) {
        NSParameterAssert([number isKindOfClass:[NSNumber class]]);
        
        if (maximumNumberForNumbers < number.integerValue) {
            maximumNumberForNumbers = number.integerValue;
        }
    }
    
    NSMutableArray *histgramArray = [NSMutableArray new];
    
    for (NSInteger index = 0; index <= maximumNumberForNumbers; index++) {
        [histgramArray addObject:@0];
    }

    for (NSNumber *number in self) {
        NSUInteger index = number.integerValue;
        NSUInteger countForIndex = [histgramArray[index] integerValue];
        [histgramArray replaceObjectAtIndex:index withObject:@(++countForIndex)];
    }
    
    return histgramArray;
}

- (CGFloat)average
{
    CGFloat sum = 0;
    
    for (NSNumber *number in self) {
        sum += number.integerValue;
    }
    
    return sum / self.count;
}

@end
