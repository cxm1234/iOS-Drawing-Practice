//
//  MyCustomView.m
//  Pracitice_1_7
//
//  Created by  generic on 2021/2/25.
//

#import "MyCustomView.h"

@implementation MyCustomView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = 4;
    [[UIColor redColor] setStroke];
    [path stroke];
}

@end
