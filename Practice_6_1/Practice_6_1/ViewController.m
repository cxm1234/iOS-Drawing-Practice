//
//  ViewController.m
//  Practice_6_1
//
//  Created by  generic on 2021/3/16.
//

#import "ViewController.h"

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

- (UIImage *)buildImageTestOne {
    
}


@end
