//
//  JXActiveMenu.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXActiveMenu;

@protocol JXActiveMenuDelegate <NSObject>

@optional
- (void)activeMenuDidClickCancel:(JXActiveMenu *)menu;

@end

@interface JXActiveMenu : UIView

// 从xib中加载，默认大小跟xib设置大小是一样的大小
+ (instancetype)activeShow;

+ (instancetype)showInPoint:(CGPoint)point;

+ (void)hideInPoint:(CGPoint)point completion:(void(^)())completin;

/** 代理 */
@property (nonatomic,weak) id<JXActiveMenuDelegate> delegate;
@end
