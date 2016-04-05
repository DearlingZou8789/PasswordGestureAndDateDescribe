//
//  NSString+MJ_DescribeTime.h
//  passwordGesture
//
//  Created by Damon on 16/4/5.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MJ_DescribeTime)
/**
 *  描述时间字符串使用非标准格式,如3分钟前
 *
 *  @return 时间差格式
 */
- (NSString *)describTimeWithNoStandardDate;
@end
