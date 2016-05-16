//
//  JXArrowSettingItem.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSettingItem.h"

@interface JXArrowSettingItem : JXSettingItem
// 当只有是这个类的时候才会执行跳转功能
/** 需要跳转的类 */
@property (nonatomic,assign) Class nameVc;

@end
