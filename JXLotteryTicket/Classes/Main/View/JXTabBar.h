//
//  JXTabBar.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXTabBarButton;
@protocol JXTabBarDelegate <NSObject>

@optional
// 协议规定，传递选中时的角标
- (void)tabBar:(JXTabBarButton *)btn btnClick:(NSInteger)index;

@end

@interface JXTabBar : UIView

/** 模型数组（UITabBarItem） */
@property (nonatomic,strong) NSArray * items;

/** 遵守协议 */
@property (nonatomic,weak) id <JXTabBarDelegate> delegate;
@end
