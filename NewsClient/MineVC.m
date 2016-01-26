//
//  MineVC.m
//  NewsClient
//
//  Created by LittleSmart on 16/1/4.
//  Copyright © 2016年 LittleSmart. All rights reserved.
//

#import "MineVC.h"

@interface MineVC ()

@end

@implementation MineVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_me.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_meHL.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createGestureRecognizer];
    
    // Do any additional setup after loading the view.
    UIImageView *_photoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _photoImage.image = [UIImage imageNamed:@"news"];
    _photoImage.center = self.view.center;
    [self.view addSubview:_photoImage];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"我的";
}

- (void)createGestureRecognizer {
    //横扫手势识别器
    UISwipeGestureRecognizer *leftToRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftToRightSwipeHandle:)];
    //注册手势识别器
    leftToRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:leftToRight];
}
#pragma mark 识别手势方法

-(void)leftToRightSwipeHandle:(UISwipeGestureRecognizer *)recognizer
{
    self.tabBarController.selectedIndex = 1;
    
    NSLog(@"从主页右滑");
    
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
