//
//  JXSettingGroupItems.h
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXSettingGroupItems : NSObject
/** 一共有多少组 */
@property (nonatomic,strong) NSArray * items;
/** 头部标题 */
@property (nonatomic,strong) NSString * headTitle;
/** 尾部标题 */
@property (nonatomic,strong) NSString * footerTitle;

+ (instancetype)settingGroupItems:(NSArray *)items headTitle:(NSString *)headTitle footerTitle:(NSString *)footerTitle;

@end
