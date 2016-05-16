//
//  JXSettingItem.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSettingItem.h"

@implementation JXSettingItem
+ (instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle {
    JXSettingItem * item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    item.subTitle = subTitle;
    
    return item;
}
@end
