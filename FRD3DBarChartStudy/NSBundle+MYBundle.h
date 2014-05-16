//
//  NSBundle+MYBundle.h
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/15.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  ファイルから基本データを生成するためのカテゴリです。
 */
@interface NSBundle (MYBundle)

/**
 *  DataSet.jsonの内容をNSArrayとして生成します。
 *
 *  @return NSArray
 */
- (NSArray *)myDataSetArray;

@end
