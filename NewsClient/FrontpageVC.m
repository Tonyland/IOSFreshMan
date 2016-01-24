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
