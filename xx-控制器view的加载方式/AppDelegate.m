//
//  AppDelegate.m
//  xx-控制器view的加载方式
//
//  Created by winson on 2018/7/17.
//  Copyright © 2018年 winson. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

/*
 1. 没有同名xib情况下（不用sb和xib） alloc init
 2. 通过 storyboard 创建
 3. 通过制定的xib情况下创建
 4. 有同名的xib情况
 5. 有同名去掉controller的情况
 6. loadView
 */

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
//    // 1. alloc init (没有颜色)
//    ViewController *vc = [ViewController new];
//    self.window.rootViewController = vc;
//    NSLog(@"%@",vc.view.backgroundColor);
    
    
    
    
    // 2. 通过 storyboard 创建 （白色 显示的 view 是 sb 中的 view）
    // 获取 storyboard 对象
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // 通过 storyboard 获取 vc 对象
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"test"];
    self.window.rootViewController = vc;
    // NSLog(@"vc的背景色：%@",vc.view.backgroundColor);
    
    
    
    
    
     // 3. 通过制定的xib情况下创建
    
    
    
    // 设置根控制器
    
    // 显示window
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
