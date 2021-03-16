//
//  Gradient.m
//  Practice_6_1
//
//  Created by  generic on 2021/3/16.
//

#import "Gradient.h"
#import <UIKit/UIKit.h>

typedef __attribute__((NSObject)) CGGradientRef GradientObject;

@interface Gradient()

@property(nonatomic, strong) GradientObject storedGradient;

@end

@implementation Gradient

- (CGGradientRef)gradient {
    return _storedGradient;
}

+ (instancetype)gradientWithColors:(NSArray *)colorsArray locations:(NSArray *)locationArray {
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    if (space == NULL) {
        NSLog(@"Error: Unable to create RGB color space");
        return nil;
    }
    
    CGFloat locations[locationArray.count];
    for (int i = 0; i < locationArray.count; i++)
        locations[i] = fminf(fmaxf([locationArray[i] floatValue], 0), 1);

    NSMutableArray *colorRefArray = [NSMutableArray array];
    for (UIColor *color in  colorsArray) {
        [colorRefArray addObject:(id)color.CGColor];
    }
    
    CGGradientRef gradientRef = CGGradientCreateWithColors(space, (__bridge CFArrayRef) colorRefArray, locations);
    CGColorSpaceRelease(space);
    if(gradientRef == NULL) {
        NSLog(@"Error: Unable to construct CGGradientRef");
        return nil;
    }
    
    Gradient *gradient = [[self alloc] init];
    gradient.storedGradient = gradientRef;
    CGGradientRelease(gradientRef);
    return gradient;
}


+ (instancetype)gradientFrom:(UIColor *)color1 to:(UIColor *)color2 {
    return [self gradientWithColors:@[color1, color2] locations:@[@(0.0f), @(1.0f)]];
}

- (void)drawFrom:(CGPoint)p1 toPoint:(CGPoint)p2 style:(int)mask {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {
        NSLog(@"Error: No context to draw to");
        return;
    }
    CGContextDrawLinearGradient(context, self.gradient, p1, p2, mask);
}

- (void)drawRadialFrom:(CGPoint)p1 toPoint:(CGPoint)p2 radii:(CGPoint)radii style:(int)mask {
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (context == NULL) {
        NSLog(@"Error: No context to draw to");
        return;
    }
    CGContextDrawRadialGradient(context, self.gradient, p1, radii.x, p2 , radii.y, mask);
}

@end
