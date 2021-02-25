//
//  ViewController.m
//  Pracitice_1_7
//
//  Created by  generic on 2021/2/25.
//

#import "ViewController.h"
#import "MyCustomView.h"

@interface ViewController ()

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
    MyCustomView *customView = [[MyCustomView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:customView];
}


@end
