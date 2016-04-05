//
//  ViewController.m
//  passwordGesture
//
//  Created by Damon on 16/3/29.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import "ViewController.h"
#import "gestureView.h"
#import "NSDate+MJ_Extension.h"

@interface ViewController ()
{

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat space = 15;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 2 * space;
    gestureView *view = [[gestureView alloc] initWithFrame:CGRectMake(space, space, width, width)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday;
    NSDate *date1 = [NSDate dateWithTimeIntervalSinceReferenceDate:1000];
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-1000];
    NSDate *date3 = [NSDate dateWithTimeIntervalSinceNow:-1500];
    NSDate *date4 = [NSDate dateWithTimeIntervalSinceNow:-2000];
    NSDate *date5 = [NSDate dateWithTimeIntervalSinceNow:-2500];
    NSDate *date6 = [NSDate dateWithTimeIntervalSinceNow:-24*60*60];
    NSDate *date7 = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
    NSLog(@"%@, %@, %@, %@, %@, %@, %@", date1, date2, date3, date4, date5, date6, date7);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:unit fromDate:date2];
    NSLog(@"components = %@", components1);
    NSLog(@"isYestoday = %d", [date6 mj_isYesterday]);
    NSLog(@"isTomrrow = %d", [date7 mj_isTomorrow]);
    NSLog(@"isThisYear = %d", [date7 mj_isThisYear]);
    NSLog(@"isThisMonth = %d", [date7 mj_isThisMonth]);
    NSLog(@"isThisDay = %d", [date7 mj_isToday]);
    NSLog(@"isThisWeek = %d", [date7 mj_isThisWeek]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
