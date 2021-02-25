//
//  ViewController.m
//  practice_1_4
//
//  Created by  generic on 2021/2/25.
//

#import "ViewController.h"


#define kViewWidth self.view.bounds.size.width
#define kViewHeight self.view.bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIImage *image = [self test2];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight)];
    imageView.image = image;
    [self.view addSubview:imageView];
}

- (UIImage *)test1 {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {
        NSLog(@"Error allocaing color space");
        return nil;
    }
    
    size_t width = self.view.bounds.size.width;
    size_t height = self.view.bounds.size.height;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width * 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    
    if (context == NULL) {
        NSLog(@"Error: Context not created!");
        CGColorSpaceRelease(colorSpace);
        return nil;
    }
    
    CGContextSetLineWidth(context, 4);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextStrokeEllipseInRect(context, CGRectMake(50, 50, 60, 60));
    
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    return  image;
}

/// Drawing an Ellipse Within a UIKit Image Context
- (UIImage *)test2 {
    CGSize targerSize = CGSizeMake(kViewWidth, kViewHeight);
    UIGraphicsBeginImageContextWithOptions(targerSize, NO, 0.0);
    
    //Retrive the current context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 4);
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextStrokeEllipseInRect(context, CGRectMake(0, 0, 200, 100));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
