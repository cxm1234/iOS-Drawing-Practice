//
//  ViewController.m
//  Practice_1_9
//
//  Created by  generic on 2021/2/26.
//

#import "ViewController.h"
#import "Utility.h"

@interface ViewController ()
@property(nonatomic, strong)UIImageView *bunnyView;
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
    self.bunnyView.image = [self getBunnyImageWithSize:self.view.bounds.size];
    [self.view addSubview:self.bunnyView];
}

- (UIImageView *)bunnyView {
    if (!_bunnyView) {
        _bunnyView = [[UIImageView alloc] initWithFrame:self.view.frame];
    }
    return _bunnyView;
}

- (UIImage *)getBunnyImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *greenColor = [UIColor colorWithRed:125 / 255.0 green:162 / 255.0 blue:63 / 255.0 alpha:1.0];
    UIColor *purpleColor = [UIColor colorWithRed:99 / 255.0 green:62 / 255.0 blue:162 / 255.0 alpha:1.0];
    
    UIBezierPath *bunnyPath = BuildBunnyPath();
    [greenColor setFill];
    [purpleColor setStroke];
    
    [bunnyPath fill];
    [bunnyPath stroke];
    
    CGContextSaveGState(context);
    
    [[UIColor orangeColor] setFill];
    [[UIColor blueColor] setStroke];
    
    [bunnyPath applyTransform:CGAffineTransformMakeTranslation(50, 0)];
    [bunnyPath fill];
    [bunnyPath stroke];
    
    CGContextRestoreGState(context);
    
    [bunnyPath applyTransform:CGAffineTransformMakeTranslation(50, 0)];
    [bunnyPath fill];
    [bunnyPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
