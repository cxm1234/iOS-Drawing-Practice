//
//  Gradient.h
//  Practice_6_1
//
//  Created by  generic on 2021/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Gradient : NSObject

+ (instancetype)gradientFrom:(UIColor *)color1 to:(UIColor *)color2;

@end

NS_ASSUME_NONNULL_END
