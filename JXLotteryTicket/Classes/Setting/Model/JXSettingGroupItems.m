//
//  JXSettingGroupItems.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSettingGroupItems.h"

@implementation JXSettingGroupItems

+ (instancetype)settingGroupItems:(NSArray *)items headTitle:(NSString *)headTitle footerTitle:(NSString *)footerTitle {
    JXSettingGroupItems * item = [[self alloc] init];
    
    item.items = items;
    item.headTitle = headTitle;
    item.footerTitle = footerTitle;
    
    return item;
}
@end
