//
//  ViewController.m
//  Practice_1_12
//
//  Created by  generic on 2021/2/26.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.imageView.image = [self getTransformImage:CGSizeMake(400, 400)];
    [self.view addSubview:self.imageView];
}

-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    }
    return _imageView;
}

- (UIImage *)getTransformImage:(CGSize)size {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    UIFont *font = [UIFont boldSystemFontOfSize:16];
    CGFloat fullSize = 0;
    for (int i = 0; i < 26; i++) {
        NSString *letter = [alphabet substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName:font}];
        fullSize += letterSize.width;
    }
    CGFloat consumeSize = 0.0f;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(size.width / 2, size.height / 2);
    CGFloat r = size.width * 0.35;
    
    // 平移坐标系
    CGContextTranslateCTM(context, center.x, center.y);
    for (int i = 0; i < 26; i++) {
        NSString *letter = [alphabet substringWithRange:NSMakeRange(i, 1)];
        
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName:font}];
        
        consumeSize += letterSize.width / 2.0f;
        CGFloat percent = consumeSize / fullSize;
        
        CGFloat theta = percent * 2 * M_PI;
        
        consumeSize += letterSize.width / 2.0f;
        
        CGContextSaveGState(context);
        CGContextRotateCTM(context, theta);
        
        CGContextTranslateCTM(context, -letterSize.width / 2, -r);
        [letter drawAtPoint:CGPointMake(0, 0) withAttributes:@{NSFontAttributeName:font}];
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
