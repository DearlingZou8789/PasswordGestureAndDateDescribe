//
//  NSString+MJ_DescribeTime.m
//  passwordGesture
//
//  Created by Damon on 16/4/5.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import "NSString+MJ_DescribeTime.h"
#import "NSDate+MJ_Extension.h"
#import "DateFormatter.h"

@implementation NSString (MJ_DescribeTime)
- (NSString *)describTimeWithNoStandardDate {
    NSDate *date = [self originDate];
    if ([date mj_isThisYear]) {
        if ([date mj_isToday]) {    //今天
            NSDateComponents *components = [date mj_delayFromDate:[NSDate date]];
            if (components.hour > 1) {
                return [NSString stringWithFormat:@"%d小时前", components.hour];
            }
            else if (components.minute > 1) {
                return [NSString stringWithFormat:@"%d分钟前", components.minute];
            }
            else {
                return @"刚刚";
            }
        }
        else if ([date mj_isYesterday]) {   //昨天
            return [NSString stringWithFormat:@"昨天 %@", [self hMSDateStr]];
        }
        else {  //今年其他时间
            return [self symdhmsDateStr];
        }
    }
    else {
        return self;
    }
}
@end
