//
//  AppDelegate.m
//  xx-多个sb
//
//  Created by winson on 2018/7/18.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 创建 window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 创建 tabbarcontroller
    UITabBarController *tabbar = [UITabBarController new];
    // 获取 sb
    UIStoryboard *sb1 = [UIStoryboard storyboardWithName:@"Hall" bundle:nil];
    // 获取 nav
    UIViewController *nav1 = [sb1 instantiateInitialViewController];
    // 获取 sb
    UIStoryboard *sb2 = [UIStoryboard storyboardWithName:@"Arena" bundle:nil];
    // 获取 nav
    UIViewController *nav2 = [sb2 instantiateInitialViewController];
    // 设置tabbar 的子控制器
    tabbar.viewControllers = @[nav1, nav2];
    // 设置 window 根控制器
    self.window.rootViewController = tabbar;
    // window 显示出来
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
