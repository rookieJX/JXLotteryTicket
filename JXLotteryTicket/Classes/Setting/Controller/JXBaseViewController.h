//
//  JXBaseViewController.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JXArrowSettingItem.h"
#import "JXSwitchSettingItem.h"
#import "JXSettingGroupItems.h"

@interface JXBaseViewController : UITableViewController

/** 一共需要多少组 */
@property (nonatomic,strong) NSMutableArray * groups;

@end
