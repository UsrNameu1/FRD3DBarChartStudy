//
//  NSBundle+MYBundle.m
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import "NSBundle+MYBundle.h"

@implementation NSBundle (MYBundle)

- (NSArray *)myDataSetArray
{
    static NSArray *myDataSetArray;
    
    if (!myDataSetArray) {
        NSString *path = [self pathForResource:@"DataSet" ofType:@"json"];
        NSError *error = nil;
        NSData *myDataSetJSONData = [NSData dataWithContentsOfFile:path
                                                           options:NSUTF8StringEncoding
                                                             error:&error];
        if (error) {
#ifndef DEBUG
            NSLog(@"DataSet.jsonの読み込みに失敗しました。: %@", error);
#endif
        }
        
        myDataSetArray = [NSJSONSerialization JSONObjectWithData:myDataSetJSONData
                                                         options:NSJSONReadingAllowFragments
                                                           error:&error];
        
        if (error) {
#ifndef DEBUG
            NSLog(@"JSONの形式が不正です。: %@", error);
#endif
        }
    }
    
    return myDataSetArray;
}

@end
