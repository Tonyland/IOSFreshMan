//
//  MainViewController.m
//  NewsClient
//
//  Created by LittleSmart on 16/1/4.
//  Copyright © 2016年 LittleSmart. All rights reserved.
//

#import "MainViewController.h"
#import "MainTabbarVC.h"
#import "FrontpageVC.h"
#import "MineVC.h"

@interface MainViewController ()

@property (nonatomic, strong) UIImageView *photoImage;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithRed:54.0/255 green:105.0/255 blue:184.0/255 alpha:1.0];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],
                                                                      NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSLog(@"测试下提交代码");
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
