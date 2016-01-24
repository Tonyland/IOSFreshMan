//
//  FrontpageVC.m
//  NewsClient
//
//  Created by LittleSmart on 16/1/4.
//  Copyright © 2016年 LittleSmart. All rights reserved.
//

#import "FrontpageVC.h"

@interface FrontpageVC ()

@property (nonatomic,strong) CALayer *maskLayer;
@property (nonatomic,strong) UIImageView *photoImage;

@end

@implementation FrontpageVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_mainframe@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_mainframeHL@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _photoImage.image = [UIImage imageNamed:@"oscar"];
    _photoImage.center = self.view.center;
    [self.view addSubview:_photoImage];

//    _photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
////    _photoImage = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    _photoImage.image = [UIImage imageNamed:@"background"];
//    _photoImage.center = self.view.center;
//    [self.view addSubview:_photoImage];
//    
//    _maskLayer = [CALayer layer];
//    _maskLayer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
//    _maskLayer.position = self.view.center;
//    _maskLayer.bounds = CGRectMake(0, 0, 60, 60);
////    _maskLayer.frame = CGRectMake(0, 0, _photoImage.frame.size.width, _photoImage.frame.size.height);
////    _photoImage.layer.mask = _maskLayer;
//    self.view.layer.mask = _maskLayer;
//    
////    UIView *maskBackgroundView = [[UIView alloc]initWithFrame:self.view.bounds];
////    maskBackgroundView.backgroundColor = [UIColor whiteColor];
////    [self.view addSubview:maskBackgroundView];
////    [self.view bringSubviewToFront:maskBackgroundView];
//    
//    CAKeyframeAnimation *maskAnimation = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
//    maskAnimation.duration = 1.0f;
//    maskAnimation.beginTime = CACurrentMediaTime() + 1.0f;
//    
//    CGRect initialBounds = _maskLayer.bounds;
//    CGRect secondBounds = CGRectMake(0, 0, 50, 50);
//    CGRect finalBounds = CGRectMake(0, 0, 2000, 2000);
//    maskAnimation.values = @[[NSValue valueWithCGRect:initialBounds],[NSValue valueWithCGRect:secondBounds],[NSValue valueWithCGRect:finalBounds]];
//    maskAnimation.keyTimes = @[@(0),@(0.5),@(1)];
//    maskAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    maskAnimation.removedOnCompletion = NO;
//    maskAnimation.fillMode = kCAFillModeForwards;
//    [self.view.layer.mask addAnimation:maskAnimation forKey:@"maskAnimation"];
    
//    [UIView animateWithDuration:0.1 delay:1.35 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        maskBackgroundView.alpha = 0.0;
//    } completion:^(BOOL finished) {
//        [maskBackgroundView removeFromSuperview];
//    }];
    
//    [UIView animateWithDuration:0.25 delay:1.3 options:UIViewAnimationOptionTransitionNone animations:^{
//        self.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.view.transform = CGAffineTransformIdentity;
//        } completion:^(BOOL finished) {
//            self.view.layer.mask = nil;
//        }];
//    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"首页";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
