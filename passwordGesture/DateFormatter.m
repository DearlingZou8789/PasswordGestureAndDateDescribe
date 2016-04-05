//
//  DateFormatter.m
//  T8
//
//  Created by Damon on 16/3/15.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import "DateFormatter.h"

@implementation DateFormatter

+ (NSDateFormatter *)fromDateFormatter {
    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YY-MM-dd HH:mm:ss"];
        formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:8];
    });
    return formatter;
}

+ (NSDateFormatter *)toDateFormatter {
    static NSDateFormatter *toDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toDateFormatter = [[NSDateFormatter alloc] init];
        [toDateFormatter setDateFormat:@"HH:mm"];
        toDateFormatter.timeZone = [[self class] fromDateFormatter].timeZone;
    });
    return toDateFormatter;
}

+ (NSDateFormatter *)toKDateFormatter {
    static NSDateFormatter *toDate2Fromatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toDate2Fromatter = [[NSDateFormatter alloc] init];
        toDate2Fromatter.timeZone = [[self class] fromDateFormatter].timeZone;
        [toDate2Fromatter setDateFormat:@"dd HH:mm"];
    });
    return toDate2Fromatter;
}

+ (NSDateFormatter *)toOptionFormatter {
    static NSDateFormatter *formatter1 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter1 = [[NSDateFormatter alloc] init];
        formatter1.timeZone = [[self class] fromDateFormatter].timeZone;
        [formatter1 setDateFormat:@"MM-dd HH:mm"];
    });
    return formatter1;
}

+ (NSDateFormatter *)shortOptionFormatter {
    static NSDateFormatter *shortFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shortFormatter = [[NSDateFormatter alloc] init];
        shortFormatter.timeZone = [[self class] fromDateFormatter].timeZone;
        [shortFormatter setDateFormat:@"HH:mm:ss"];
    });
    return shortFormatter;
}

+ (NSDateFormatter *)yearMonthDayFormatter {
    static NSDateFormatter *ymdFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ymdFormatter = [[NSDateFormatter alloc] init];
        ymdFormatter.timeZone = [[self class] fromDateFormatter].timeZone;
        [ymdFormatter setDateFormat:@"YY-MM-dd"];
    });
    return ymdFormatter;
}

+ (NSDateFormatter *)shortYearMonthDayMDSFormatter {
    static NSDateFormatter *symmdsFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        symmdsFormatter = [[NSDateFormatter alloc] init];
        symmdsFormatter.timeZone = [[self class] fromDateFormatter].timeZone;
        [symmdsFormatter setDateFormat:@"MM-dd HH:mm:ss"];
    });
    return symmdsFormatter;
}

@end

@implementation NSString (DateFormatter)
+ (NSString *)stringFromDate:(NSDate *)date {
    if (date) {
        return [[DateFormatter fromDateFormatter] stringFromDate:date];
    }
    return nil;
}

- (NSDate *)originDate {
    if (self.length > 0) {
        return [[DateFormatter fromDateFormatter] dateFromString:self];
    }
    return nil;
}

- (NSString *)hourMinuteDateStr {
    if (self.length > 0) {
        return [[DateFormatter toDateFormatter] stringFromDate:[self originDate]];
    }
    return nil;
}

- (NSString *)dHMDateStr {
    if (self.length > 0) {
        return [[DateFormatter toKDateFormatter] stringFromDate:[self originDate]];
    }
    return nil;
}

- (NSString *)mDHMDateStr {
    if (self.length > 0) {
        return [[DateFormatter toOptionFormatter] stringFromDate:[self originDate]];
    }
    return nil;
}

- (NSString *)hMSDateStr {
    if (self.length > 0) {
        return [[DateFormatter shortOptionFormatter] stringFromDate:[self originDate]];
    }
    return nil;
}

- (NSString *)yMDDateStr {
    if (self.length > 0) {
        return [[DateFormatter yearMonthDayFormatter] stringFromDate:[self originDate]];
    }
    return nil;
}

- (NSString *)symdhmsDateStr {
    if (self.length > 0) {
        return [[DateFormatter shortYearMonthDayMDSFormatter] stringFromDate:[self originDate]];
    }
    return nil;
}

- (NSString *)stringDateWithNumber:(NSNumber *)number {
    NSInteger nu = number.integerValue;
    if (nu == 2) {
        return [self hMSDateStr];
    } else if (nu == 3) {
        return [self mDHMDateStr];
    } else if (nu == 1 || nu == 4 || nu == 5 || nu == 6) {
        return [self hourMinuteDateStr];
    }
    return nil;
}
@end
