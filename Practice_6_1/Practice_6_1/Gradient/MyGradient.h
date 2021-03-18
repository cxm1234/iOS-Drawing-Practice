//
//  Gradient.h
//  Practice_6_1
//
//  Created by  generic on 2021/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyGradient : NSObject

+ (instancetype)gradientFrom:(UIColor *)color1 to:(UIColor *)color2;

- (void)drawFrom:(CGPoint)p1 toPoint:(CGPoint)p2 style:(int)mask;

- (void)drawFrom:(CGPoint) p1 toPoint: (CGPoint) p2;

@end

NS_ASSUME_NONNULL_END
