//
//  ViewController.m
//  passwordGesture
//
//  Created by Damon on 16/3/29.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import "ViewController.h"
#import "gestureView.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
