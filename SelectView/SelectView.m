//
//  SelectView.m
//  test01
//
//  Created by kt on 14/12/31.
//  Copyright (c) 2014年 kt. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView
{
    BOOL isSelect;
}

- (void)select {
    isSelect = YES;
    [self setNeedsDisplay];
}

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        isSelect = NO;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectTap:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
    }
    return self;
}
-(void)selectTap:(UITapGestureRecognizer *)tap
{
    isSelect = isSelect?NO:YES;
    [self setNeedsDisplay];
    
}
- (void)drawRect:(CGRect)rect {
     NSInteger lineWidth = rect.size.height/100;
    NSInteger r = rect.size.height/2-lineWidth;
   
    CGPoint center = CGPointMake(rect.size.width/2,  rect.size.height/2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWidth);//线的宽度
    CGContextAddArc(context, center.x, center.y, r, 0, 2*M_PI, 0); //添加一个圆
          if(isSelect)
        {
            UIColor*aColor = [UIColor colorWithRed:23.0/255.0 green:126.0/255.0 blue:251.0/255.0 alpha:1];
            CGContextSetStrokeColorWithColor(context, aColor.CGColor);
            CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
            CGContextDrawPath(context, kCGPathFillStroke);
            [self drawLine:r center:center];
        }
        else
        {
            UIColor*aColor = [UIColor colorWithRed:193/255.0 green:193/255.0 blue:193/255.0 alpha:1];
            CGContextSetStrokeColorWithColor(context, aColor.CGColor);
            CGContextStrokePath(context);
        }
  
   
}
-(void)drawLine:(NSInteger)r center:(CGPoint)point
{
    UIColor *lineColor = [UIColor colorWithRed:254/255.0 green:254/255.0 blue:254/255.0 alpha:1.0];
    CGFloat pace = (r+1)*2/5;
    CGFloat lineWith = ((r+1)*0.1)<1?1:(r+1)*0.1;
    
     CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, lineWith);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextMoveToPoint(context, pace, r);
    CGContextAddLineToPoint(context, 2*pace, r+pace);
    CGContextAddLineToPoint(context, 1.4*pace+r, 1.4*pace);
    CGContextStrokePath(context);
}

@end
