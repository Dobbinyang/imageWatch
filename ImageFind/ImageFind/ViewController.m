//
//  ViewController.m
//  ImageFind
//
//  Created by ybb on 2017/2/14.
//  Copyright © 2017年 ybb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGR];
    
    UIPinchGestureRecognizer *pinchGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinchGR.delegate = self;
    [self.view addGestureRecognizer:pinchGR];
    
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotationGR.delegate = self;
    [self.view addGestureRecognizer:rotationGR];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tapGR.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGR];
    
}

- (void)pan:(UIPanGestureRecognizer *)gr
{
    CGPoint translation = [gr translationInView:self.view];
    CGPoint center = self.imageV.center;
    center.x += translation.x;
    center.y += translation.y;
    self.imageV.center = center;
    [gr setTranslation:CGPointZero inView:self.view];
}

- (void)pinch:(UIPinchGestureRecognizer *)gr
{
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, gr.scale, gr.scale);
    gr.scale = 1;
}

- (void)rotation:(UIRotationGestureRecognizer *)gr
{
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, gr.rotation);
    gr.rotation = 0;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)tap:(UITapGestureRecognizer *)gr
{
    self.imageV.transform = CGAffineTransformIdentity;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
