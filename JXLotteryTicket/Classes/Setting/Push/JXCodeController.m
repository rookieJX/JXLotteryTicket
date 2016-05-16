//
//  JXCodeController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXCodeController.h"
#import "JXArrowSettingItem.h"
#import "JXSettingGroupItems.h"

@interface JXCodeController ()

@end

@implementation JXCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup1];
}

- (void)setUpGroup1
{
    
    JXArrowSettingItem * redeemCode = [JXArrowSettingItem settingItemWithImage:nil title:@"开奖推送" subTitle:nil];
    redeemCode.nameVc = [JXArrowSettingItem class];
    
    
    JXArrowSettingItem *item = [JXArrowSettingItem settingItemWithImage:nil title:@"开奖啦啦啦啦" subTitle:nil];
    item.nameVc = [JXArrowSettingItem class];
    
    JXArrowSettingItem *item1 = [JXArrowSettingItem settingItemWithImage:nil title:@"使用兑换码" subTitle:nil];
    JXArrowSettingItem *item2 = [JXArrowSettingItem settingItemWithImage:nil title:@"使用兑换码" subTitle:nil];
    
    NSArray * array = @[redeemCode,item,item1,item2];
    // 当前组有多少行
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:nil footerTitle:nil];
    
    [self.groups addObject:group];
    
}


@end
