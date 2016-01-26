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
    [self createGestureRecognizer];
    
    _photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _photoImage.image = [UIImage imageNamed:@"oscar"];
    _photoImage.center = self.view.center;
    [self.view addSubview:_photoImage];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"首页";
}

- (void)createGestureRecognizer {
    //横扫手势识别器
    UISwipeGestureRecognizer *rightToLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightToLeftSwipeHandle:)];
    UISwipeGestureRecognizer *leftToRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftToRightSwipeHandle:)];

    //设置手势识别器属性（扫动方向）
    rightToLeft.direction = UISwipeGestureRecognizerDirectionLeft;

    //注册手势识别器
    leftToRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightToLeft];
    [self.view addGestureRecognizer:leftToRight];
}
#pragma mark 识别手势方法

-(void)rightToLeftSwipeHandle:(UISwipeGestureRecognizer *)recognizer
{
    self.tabBarController.selectedIndex = 2;
    NSLog(@"首页左滑");
}
-(void)leftToRightSwipeHandle:(UISwipeGestureRecognizer *)recognizer
{
    self.tabBarController.selectedIndex = 0;
    NSLog(@"首页右滑");
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
