//
//  NSDate+MJ_Extension.h
//  passwordGesture
//
//  Created by Damon on 16/4/5.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MJ_Extension)
/**
 *  比较self和from时间的差值
 *
 *  @param date 以前的时间
 *
 *  @return 返回一个NSDateComponents:包括年月日时分秒
 */
- (NSDateComponents *)mj_delayFromDate:(NSDate *)date;
/**
 *  是否为今年
 *
 *  @return 返回bool类型,YES今年
 */
- (BOOL)mj_isThisYear;
/**
 *  是否为本月
 *
 *  @return 返回bool类型,YES本月
 */
- (BOOL)mj_isThisMonth;
/**
 *  是否为本周
 *
 *  @return 返回bool类型,YES本周
 */
- (BOOL)mj_isThisWeek;
/**
 *  是否是今天
 *
 *  @return 返回bool类型,YES今天
 */
- (BOOL)mj_isToday;
/**
 *  是否为昨天
 *
 *  @return 返回bool类型,YES昨天
 */
- (BOOL)mj_isYesterday;
/**
 *  是否为明天
 *
 *  @return 返回bool类型,YES明天
 */
- (BOOL)mj_isTomorrow;

@end