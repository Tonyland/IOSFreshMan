//
//  MainTabbarVC.m
//  NewsClient
//
//  Created by LittleSmart on 16/1/4.
//  Copyright © 2016年 LittleSmart. All rights reserved.
//

#import "MainTabbarVC.h"

@interface MainTabbarVC ()

@end

@implementation MainTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor colorWithRed:54.0/255 green:105.0/255 blue:184.0/255 alpha:0.5];
    self.tabBar.translucent = NO;//保证单元格不被tabbar遮挡
    // Do any additional setup after loading the view.
    
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
