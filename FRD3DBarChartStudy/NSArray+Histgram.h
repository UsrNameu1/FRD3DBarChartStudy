//
//  NSArray+Histgram.h
//  FRD3DBarChartStudy
//
//  Created by adachi.yuichi on 2014/05/16.
//  Copyright (c) 2014年 yad. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSArrayからヒストグラムを生成するためのカテゴリです。
 */
@interface NSArray (Histgram)

/**
 *  メッセージ受信オブジェクトがNSNumberのみで構成されるNSArrayに対して使用可能です。
 *
 *  @return ヒストグラムNSArray
 */
- (NSArray *)histgramArray;

/**
 *  メッセージ受信オブジェクトがNSNumberのみで構成されるNSArrayに対して平均値を導出します。
 *
 *  @return 平均値
 */
- (CGFloat)average;

@end
