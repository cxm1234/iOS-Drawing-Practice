//
//  ViewController.m
//  Practice_1_14
//
//  Created by  generic on 2021/2/26.
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
    self.imageView.image = [self linePathConflicting:CGRectMake(0, 0, 400, 400)];
    [self.view addSubview:self.imageView];
}


- (UIImage *)linePathConflicting:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *purpleColor = [UIColor colorWithRed:99 / 255.0 green:62 / 255.0 blue:162 / 255.0 alpha:1.0];
    UIColor *greenColor = [UIColor colorWithRed:125 / 255.0 green:162 / 255.0 blue:63 / 255.0 alpha:1.0];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:32];
    path.lineWidth = 4;
    
    CGContextSetLineWidth(context, 20);
    
    [purpleColor set];
    
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
    
    [greenColor set];
    [path stroke];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 400, 400)];
    }
    return _imageView;
}
@end
