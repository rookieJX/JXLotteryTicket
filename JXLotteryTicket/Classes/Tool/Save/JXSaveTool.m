//
//  JXSaveTool.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//  存储业务

#import "JXSaveTool.h"


@implementation JXSaveTool

+ (id)objectForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}


+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}
@end
