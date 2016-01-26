//
//  AppDelegate.m
//  NewsClient
//
//  Created by LittleSmart on 16/1/2.
//  Copyright © 2016年 LittleSmart. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MainTabbarVC.h"
#import "FrontpageVC.h"
#import "MineVC.h"
#import "BreakingNews.h"

@interface AppDelegate ()

@property (nonatomic, strong) CALayer *maskLayer;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    BreakingNews *firstPage = [[BreakingNews alloc]initWithStyle:UITableViewStyleGrouped];
    FrontpageVC *frontPage = [[FrontpageVC alloc]init];
    MineVC *minePage = [[MineVC alloc]init];
    
    MainTabbarVC *tabbarVC = [[MainTabbarVC alloc]init];
    tabbarVC.viewControllers = @[firstPage,frontPage,minePage];
    tabbarVC.selectedIndex = 0;
    
    MainViewController *mainVC = [[MainViewController alloc]initWithRootViewController:tabbarVC];
    self.window.rootViewController = mainVC;
    [self.window makeKeyAndVisible];
    
    self.window.backgroundColor = [UIColor colorWithRed:232.0/255 green:232.0/255 blue:232.0/255 alpha:1.0f];
    
    //以下代码用来设置开场动画，可以忽略
    _maskLayer = [CALayer layer];
    _maskLayer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
    _maskLayer.position = mainVC.view.center;
    _maskLayer.bounds = CGRectMake(0, 0, 60, 60);
    mainVC.view.layer.mask = _maskLayer;
    
    CAKeyframeAnimation *maskAnimation = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    maskAnimation.duration = 1.0f;
    maskAnimation.beginTime = CACurrentMediaTime() + 1.0f;
    
    CGRect initialBounds = _maskLayer.bounds;
    CGRect secondBounds = CGRectMake(0, 0, 50, 50);
    CGRect finalBounds = CGRectMake(0, 0, 2000, 2000);
    maskAnimation.values = @[[NSValue valueWithCGRect:initialBounds],[NSValue valueWithCGRect:secondBounds],[NSValue valueWithCGRect:finalBounds]];
    maskAnimation.keyTimes = @[@(0),@(0.5),@(1)];
    maskAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    maskAnimation.removedOnCompletion = NO;
    maskAnimation.fillMode = kCAFillModeForwards;
    [mainVC.view.layer.mask addAnimation:maskAnimation forKey:@"maskAnimation"];
    
    [UIView animateWithDuration:0.25 delay:1.3 options:UIViewAnimationOptionTransitionNone animations:^{
        mainVC.view.transform = CGAffineTransformMakeScale(1.05, 1.05);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            mainVC.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            mainVC.view.layer.mask = nil;
        }];
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
