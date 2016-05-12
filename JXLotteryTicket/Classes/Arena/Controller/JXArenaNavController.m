//
//  JXArenaNavController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/12.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXArenaNavController.h"

@implementation JXArenaNavController

+ (void)initialize {
    // 设置导航栏背景颜色,必须在导航栏还没有显示的时候设置，如果自定义导航栏，在其中设置了背景颜色，那么这里设置就会失败
    // 图片尺寸不够需要拉伸
    // 导航栏需要自己去管理，我们需要这个类跳转到子页面也会有这个主题颜色，所以需要自定义主题导航栏
    UIImage * image = [UIImage imageStrechableWithImageName:@"NLArenaNavBar64"];
    
    // 获取当前类的所有子类
    UINavigationBar * bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

@end
