//
//  AppDelegate.m
//  SLDrawTabbar
//
//  Created by lsl on 2017/7/20.
//  Copyright © 2017年 lsl. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FirstChildViewController.h"
#import "SLTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FirstViewController *firstvc = [[FirstViewController alloc] init];
    SecondViewController *secondvc = [[SecondViewController alloc] init];
    ThirdViewController *thirdvc = [[ThirdViewController alloc] init];
   
    NSArray *dataArray = @[
                           @{@"text": @"首页", @"iconNormal":[UIImage imageNamed:@"home"], @"iconSelect":[UIImage imageNamed:@"home_Select"], @"vc": [[UINavigationController alloc] initWithRootViewController:firstvc]},
                           @{@"text": @"", @"iconNormal":[UIImage imageNamed:@"add"], @"iconSelect":[UIImage imageNamed:@"add_Select"], @"vc": secondvc},
                           @{@"text": @"个人中心", @"iconNormal":[UIImage imageNamed:@"person"], @"iconSelect":[UIImage imageNamed:@"person_Select"], @"vc": thirdvc}];
    
    SLTabBarController *tabBarvc = [[SLTabBarController alloc] initWithArray:dataArray];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarvc;
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
