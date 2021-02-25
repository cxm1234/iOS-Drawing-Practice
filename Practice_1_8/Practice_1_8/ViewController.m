//
//  ViewController.m
//  Practice_1_8
//
//  Created by  generic on 2021/2/25.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.imageView.image = [self buildImage];
    [self.view addSubview:self.imageView];
}

- (UIImage *)buildImage {
    CGRect rect = CGRectMake(0, 0, 200, 200);
    UIBezierPath *shape1 = [UIBezierPath bezierPathWithOvalInRect:rect];
    rect.origin.x += 100;
    UIBezierPath *shape2 = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    UIGraphicsBeginImageContext(CGSizeMake(300, 300));
    UIColor *purpleColor = [UIColor colorWithRed:99 / 255.0 green:62 / 255.0 blue:162 / 255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:125 / 255.0 green:162 / 255.0 blue:63 / 255.0 alpha:1.0];
    
    purpleColor = [purpleColor colorWithAlphaComponent:0.5f];
    
    [purpleColor set];
    [shape1 fill];
    
    greenColor = [greenColor colorWithAlphaComponent:0.5f];
    
    [greenColor set];
    [shape2 fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  image;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 340, 340)];
    }
    return _imageView;
}


@end
