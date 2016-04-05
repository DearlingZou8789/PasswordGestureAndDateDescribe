//
//  NSDate+MJ_Extension.m
//  passwordGesture
//
//  Created by Damon on 16/4/5.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import "NSDate+MJ_Extension.h"

#define CalendarUnitNormal (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday | NSCalendarUnitWeekOfYear | NSCalendarUnitTimeZone)

@implementation NSDate (MJ_Extension)
- (NSDateComponents *)mj_delayFromDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:CalendarUnitNormal fromDate:date toDate:self options:0];
}

- (BOOL)mj_isThisYear {
    return [self mj_compareDateWithValueForKey:@"year" spaceNumber:0];
}

- (BOOL)mj_isThisWeek {
    return [self mj_compareDateWithValueForKey:@"week" spaceNumber:0];
}

- (BOOL)mj_isThisMonth {
    return [self mj_compareDateWithValueForKey:@"month" spaceNumber:0];
}

- (BOOL)mj_isToday {
    return [self mj_compareDateWithValueForKey:@"day" spaceNumber:0];
}

- (BOOL)mj_isYesterday {
    return [self mj_compareDateWithValueForKey:@"day" spaceNumber:1];
}

- (BOOL)mj_isTomorrow {
    return [self mj_compareDateWithValueForKey:@"day" spaceNumber:-1];
}

- (BOOL)mj_compareDateWithValueForKey:(NSString *)key spaceNumber:(NSInteger)space {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *nowComponents = [calendar components:CalendarUnitNormal fromDate:[NSDate date]];
    NSDateComponents *beforeComponents = [calendar components:CalendarUnitNormal fromDate:self];
    NSInteger nowValue = [[nowComponents valueForKey:key] integerValue];
    NSInteger beforeValue = [[beforeComponents valueForKey:key] integerValue];
    return nowValue == beforeValue + space;
}
@end
