//
//  ViewController.m
//  Practice_4_9
//
//  Created by  generic on 2021/3/4.
//

#import "ViewController.h"
#import "BezierUtils.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}

- (void)test {
    self.imageView.image = [self buildImageWith:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:self.imageView];
}

- (UIImage *)buildImageWith:(CGRect)targetRect {
    UIGraphicsBeginImageContextWithOptions(targetRect.size, NO, 0.0);
    
    UIFont *font = [UIFont systemFontOfSize:16];
    UIBezierPath *path = BezierPathFromString(@"Hello World", font);
    FitPathToRect(path, targetRect);
    [path fill:[UIColor greenColor]];
    [path strokeInside:4];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImageView *)imageView {
    if(!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    }
    return _imageView;
}


@end
