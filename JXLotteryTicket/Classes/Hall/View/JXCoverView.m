//
//  JXCoverView.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXCoverView.h"

@implementation JXCoverView

+ (void)show {
    // 创建蒙版对象
    JXCoverView * cover = [[JXCoverView alloc] init];
    
    // 获取主程序窗口
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    // 蒙版属性
    cover.backgroundColor = [UIColor grayColor];
    cover.alpha = 0.7;
    cover.frame = window.frame;
    
    [window addSubview:cover];

}

// 类方法隐藏控件
+ (void)hide {
    // 遍历主窗口的所有子控件，判断他的类是否是当前类
    for (UIView * childView in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([childView isKindOfClass:[self class]]) {
            [childView removeFromSuperview];
        }
    }
}

@end
