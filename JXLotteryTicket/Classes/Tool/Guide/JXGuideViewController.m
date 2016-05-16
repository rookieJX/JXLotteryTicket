//
//  JXGuideViewController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//  选着跟控制器

#import "JXGuideViewController.h"
#import "JXViewController.h"
#import "JXNewFeatureController.h"
#import "JXSaveTool.h"

#define JXVersion @"version"

@implementation JXGuideViewController
+ (UIViewController *)chooseRootViewController {
    // 判断当前版本号
    NSDictionary * dict = [NSBundle mainBundle].infoDictionary;
    NSString * newVersion = dict[@"CFBundleShortVersionString"];
    
    // 多态
    UIViewController * rootVc = nil;
    
    // 获取偏好设置内部存储的版本号
    NSString * oldVersion = [JXSaveTool objectForKey:JXVersion];
    if (![newVersion isEqualToString:oldVersion]) { // 如果两次不相等就进入新特新画面，并且存储当前版本
        rootVc = [[JXNewFeatureController alloc] init];
        [JXSaveTool setObject:newVersion forKey:JXVersion];
    } else { // 进入主框架
        rootVc = [[JXViewController alloc] init];
    }
    
    return rootVc;
}
@end
