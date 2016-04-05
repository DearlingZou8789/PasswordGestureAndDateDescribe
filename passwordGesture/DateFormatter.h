//
//  DateFormatter.h
//  T8
//
//  Created by Damon on 16/3/15.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatter : NSObject

//数据源中的标准时间格式(YY-MM-dd HH:mm:ss)
+ (NSDateFormatter *)fromDateFormatter;
//分时图,二元期权的显示时间格式(HH:mm)
+ (NSDateFormatter *)toDateFormatter;
//K线图的显示时间格式(dd HH:mm)
+ (NSDateFormatter *)toKDateFormatter;
//长期期权的显示时间格式(MM-dd HH:mm)
+ (NSDateFormatter *)toOptionFormatter;
//短期时间格式(HH:mm:ss)
+ (NSDateFormatter *)shortOptionFormatter;
//年月日时间格式(YY-MM-dd)
+ (NSDateFormatter *)yearMonthDayFormatter;
//年月日时分秒(YY-MM-dd HH:mm:ss)缩写
+ (NSDateFormatter *)shortYearMonthDayMDSFormatter;
@end

@interface NSString (DateFormatter)
//将时间转换成标准格式的字符串
+ (NSString *)stringFromDate:(NSDate *)date;
//将服务器的时间字符串转成
- (NSDate *)originDate;
//将原始时间转换成HH:mm
- (NSString *)hourMinuteDateStr;
//将原始时间转换成(dd HH:mm)
- (NSString *)dHMDateStr;
//将原始时间转换成(MM-dd HH:mm)
- (NSString *)mDHMDateStr;
//将原始时间转换成(HH:mm:ss)
- (NSString *)hMSDateStr;
//年月日时间格式转成成(HH-MM-dd)
- (NSString *)yMDDateStr;
//年月日时分秒(YY-MM-dd HH:mm:ss)缩写
- (NSString *)symdhmsDateStr;

//期权类型的对应的时间格式(算是一个简便方法提供者)
- (NSString *)stringDateWithNumber:(NSNumber *)number;
@end
