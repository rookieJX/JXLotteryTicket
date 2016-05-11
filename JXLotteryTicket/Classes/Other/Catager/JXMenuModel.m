//
//  JXMenuModel.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXMenuModel.h"

@implementation JXMenuModel
+ (instancetype)menuModelImage:(UIImage *)image title:(NSString *)title {
    JXMenuModel * menu = [[self alloc] init];
    menu.image = image;
    menu.title = title;
    return menu;
}
@end
