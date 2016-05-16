//
//  JXSettingController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSettingController.h"
#import "JXSettingItem.h"
#import "JXSettingGroupItems.h"

#import "JXSwitchSettingItem.h"
#import "JXArrowSettingItem.h"
#import "JXSettingCell.h"

#import "JXBlurView.h"
#import "MBProgressHUD.h"

#import "JXCodeController.h"
#import "JXScoreController.h"

@interface JXSettingController ()

@end

@implementation JXSettingController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
    
    [self setupGroup1];
    
    [self setupGroup2];
}

- (void)setupGroup0 {
    JXArrowSettingItem * item = [JXArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    // 跳转之后的类名
    item.nameVc = [UIViewController class];
    NSArray * array = @[item];
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:@"测试标题1" footerTitle:nil];
    [self.groups addObject:group];
}

- (void)setupGroup1 {
    JXArrowSettingItem * item = [JXArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    item.nameVc = [JXCodeController class];
    JXSwitchSettingItem * item1 = [JXSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXSwitchSettingItem * item2 = [JXSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    NSArray * array = @[item,item1,item2];
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:nil footerTitle:nil];
    [self.groups addObject:group];
}
- (void)setupGroup2 {
    JXArrowSettingItem * item = [JXArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"检查更新版本" subTitle:nil];
    item.itemBlock = ^(NSIndexPath * indexPath) {
        JXBlurView * blur = [[JXBlurView alloc] initWithFrame:JXBouns];
        [JXKeyWindow addSubview:blur];
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:blur animated:YES];
        hud.label.text = @"请求中";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
            [blur removeFromSuperview];
        });
    };
    
    JXArrowSettingItem * item1 = [JXArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    item1.nameVc = [JXScoreController class];
    JXArrowSettingItem * item2 = [JXArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXArrowSettingItem * item3 = [JXArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    NSArray * array = @[item,item1,item2,item3];
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:nil footerTitle:nil];

    [self.groups addObject:group];
}






@end