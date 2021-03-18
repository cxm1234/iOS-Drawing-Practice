//
//  ViewController.m
//  Practice_6_1
//
//  Created by  generic on 2021/3/16.
//

#import "ViewController.h"
#import "MyGradient.h"
#import "Utility.h"

#define WHITE_LEVEL(_amt_,_alpha_) [UIColor colorWithWhite:(_amt_) alpha:(_alpha_)]
@interface ViewController ()

@property(nonatomic, strong)UIImageView *imageView;

@end

@implementation ViewController

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 400, 400)];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view addSubview:self.imageView];
    UIImage *image = [self buildImageTestOne:CGSizeMake(400, 400)];
    self.imageView.image = image;
}

- (UIImage *)buildImageTestOne:(CGSize)targetSize {
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    CGRect targetRect = SizeMakeRect(targetSize);
    CGRect inset = CGRectInset((CGRect)targetRect, 80, 80);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:inset cornerRadius:32];
    
    MyGradient *gradient = [MyGradient gradientFrom:WHITE_LEVEL(0, 0) to:WHITE_LEVEL(0, 1)];
    CGPoint p1 = RectGetPointAtPercents(path.bounds, 0.7, 0.5);
    CGPoint p2 = RectGetPointAtPercents(path.bounds, 1.0, 0.5);
    
    UIColor *greenColor = [UIColor colorWithRed:125 / 255.0 green:162 / 255.0 blue:63 / 255.0 alpha:1.0];
    [path fill:greenColor];
    [path addClip];
    [gradient drawFrom:p1 toPoint:p2 style:0];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
