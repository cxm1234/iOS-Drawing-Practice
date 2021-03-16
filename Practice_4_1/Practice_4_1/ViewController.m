//
//  ViewController.m
//  Practice_4_1
//
//  Created by  generic on 2021/3/2.
//

#import "ViewController.h"
#import "Utility.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
}

- (void)test1 {
    self.imageView.image = [self build:CGSizeMake(300, 300)];
    [self.view addSubview:self.imageView];
}

- (UIImage *)build:(CGSize)targetSize {
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    CGRect fullRect = CGRectInset((CGRect){.size = targetSize}, 30, 30);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    CGRect inset = CGRectInset(fullRect, 32, 32);
    UIBezierPath *faceOutline = [UIBezierPath bezierPathWithOvalInRect:inset];
    [bezierPath appendPath:faceOutline];
    
    // Move in again, for the eyes and mouth
    CGRect insetAgain = CGRectInset(inset, 64, 64);
    
    // Calculate a radius
    CGPoint referencePoint = CGPointMake(CGRectGetMinX(insetAgain), CGRectGetMaxY(insetAgain));
    CGPoint center = RectGetCenter(inset);
    CGFloat radius = PointDistanceFromPoint(referencePoint, center);
    
    // Add a smile from 40 degrees around ro 140 degrees
    UIBezierPath *smile = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:RadiansFromDegrees(140) endAngle:RadiansFromDegrees(40) clockwise:NO];
    [bezierPath appendPath:smile];
    
    // Build Eye 1
    CGPoint p1 = CGPointMake(CGRectGetMinX(insetAgain), CGRectGetMinY(insetAgain));
    CGRect eyeRect1 = RectAroundCenter(p1, CGSizeMake(20, 20));
    UIBezierPath *eye1 = [UIBezierPath bezierPathWithRect:eyeRect1];
    [bezierPath appendPath:eye1];
    
    CGPoint p2 = CGPointMake(CGRectGetMaxX(insetAgain), CGRectGetMinY(insetAgain));
    CGRect eyeRect2 = RectAroundCenter(p2, CGSizeMake(20, 20));
    UIBezierPath *eye2 = [UIBezierPath bezierPathWithRect:eyeRect2];
    [bezierPath appendPath:eye2];
    
    bezierPath.lineWidth = 4;
    [bezierPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  image;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    }
    return _imageView;
}
@end
