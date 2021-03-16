//
//  ViewController.m
//  Practice_6_1
//
//  Created by  generic on 2021/3/16.
//

#import "ViewController.h"
#import "Gradient.h"
#define WHITE_LEVEL(_amt_,_alpha_) [UIColor colorWithWhite:(_amt_) alpha:(_alpha_)]
@interface ViewController ()

@property(nonatomic, strong)UIImageView *imageView;

@end

@implementation ViewController

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (UIImage *)buildImageTestOne:(CGSize)targetSize {
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, 0.0);
    
    Gradient *gradient = [Gradient gradientFrom:WHITE_LEVEL(0, 0) to:WHITE_LEVEL(0, 1)];
    
    
    
}


@end
