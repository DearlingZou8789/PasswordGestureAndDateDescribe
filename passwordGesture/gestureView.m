//
//  gestureView.m
//  passwordGesture
//
//  Created by Damon on 16/3/29.
//  Copyright © 2016年 zhangle.in.zmj. All rights reserved.
//

#import "gestureView.h"
@interface gestureView ()
{
    NSMutableArray *selectBtnArr;
    NSMutableArray *allBtnArr;
    CGPoint startPoint;
    CGPoint currentPoint;
    CGPoint endPoint;
    CAShapeLayer *shaperLayer;
}
@end

static NSInteger const MAXCOUNT = 9;
static CGFloat const WIDTH = 5;
@implementation gestureView
- (NSMutableArray *)selectBtnArr {
    if (selectBtnArr == nil) {
        selectBtnArr = @[].mutableCopy;
    }
    return selectBtnArr;
}

- (NSMutableArray *)allBtnArr {
    if (allBtnArr == nil) {
        allBtnArr = @[].mutableCopy;
    }
    return allBtnArr;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        for (NSInteger i = 0; i < MAXCOUNT; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
            [[self allBtnArr] addObject:btn];
            btn.tag = i;
            btn.userInteractionEnabled = NO;
            btn.opaque = YES;
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat leftSpace = 10;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 6;
    __block CGFloat startX = leftSpace;
    __block CGFloat startY = leftSpace;
    NSInteger count = (NSInteger)sqrt(MAXCOUNT);
    CGFloat btnSpaceX = (CGRectGetWidth(self.frame) - 2 * leftSpace - count * width) / (count - 1);
    CGFloat btnSpaceY = (CGRectGetHeight(self.frame) - 2 * leftSpace - count * width) / (count - 1);
    
    [[self allBtnArr] enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger x = idx / count;
        NSInteger y = idx % count;
        
        startX = leftSpace + (btnSpaceX + width) * y;
        startY = leftSpace + (btnSpaceY + width) * x;
        btn.frame = CGRectMake(startX, startY, width, width);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (shaperLayer == nil) {
        shaperLayer = [CAShapeLayer layer];
        shaperLayer.lineWidth = WIDTH;
        shaperLayer.strokeColor = [UIColor blueColor].CGColor;
        shaperLayer.backgroundColor = nil;
        shaperLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:shaperLayer];
        [self.layer insertSublayer:shaperLayer atIndex:0];
    }
    UITouch *touch = [touches anyObject];
    startPoint = [touch locationInView:self];
    [self centerOfButtonWithPoint:startPoint];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    currentPoint = [touch locationInView:self];
    [self centerOfButtonWithPoint:currentPoint];
    [self setLayerPath:NO];
}

- (void)centerOfButtonWithPoint:(CGPoint)point {
    [[self allBtnArr] enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(btn.frame, point) && !btn.selected) {
            [[self selectBtnArr] addObject:btn];
            btn.selected = YES;
            *stop = YES;
        }
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    endPoint = [touch locationInView:self];
    [self centerOfButtonWithPoint:endPoint];
    [self setLayerPath:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self judgePasswd];
    });
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)judgePasswd {
    __block NSMutableString *str = [NSMutableString string];
    [[self selectBtnArr] enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        [str appendFormat:[NSString stringWithFormat:@"%d", (int)btn.tag]];
    }];
    NSLog(@"%@", str);
}

- (void)setLayerPath:(BOOL)flag {
    if ([self selectBtnArr].count == 0) {
        return;
    }
    __block UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [[self selectBtnArr] enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            [path moveToPoint:btn.center];
        } else {
            [path addLineToPoint:btn.center];
        }
    }];
    if (!flag) {
        [path addLineToPoint:currentPoint];
    }
    shaperLayer.path = path.CGPath;
}

- (void)dealloc {
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}
@end
