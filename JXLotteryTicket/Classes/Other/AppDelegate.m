//
//  AppDelegate.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "AppDelegate.h"
#import "JXViewController.h"
#import "JXNewFeatureController.h"
#define JXVersion @"version"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 判断当前版本号
    NSDictionary * dict = [NSBundle mainBundle].infoDictionary;
    NSString * newVersion = dict[@"CFBundleShortVersionString"];
    
    // 多态
    UIViewController * rootVc = nil;
    
    // 获取偏好设置内部存储的版本号
    NSString * oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:JXVersion];
//    if (![newVersion isEqualToString:oldVersion]) { // 如果两次不相等就进入新特新画面，并且存储当前版本
        rootVc = [[JXNewFeatureController alloc] init];
//    } else { // 进入主框架
//        rootVc = [[JXViewController alloc] init];
//    }
    
    self.window.rootViewController = rootVc;
    
    [self.window makeKeyAndVisible];
    
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
