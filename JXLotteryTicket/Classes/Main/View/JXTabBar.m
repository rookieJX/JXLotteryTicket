//
//  JXTabBar.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXTabBar.h"

@implementation JXTabBar

// 我们自己的tabBar的按钮也需要模型，UITabBar上的按钮交给UITabBarItem
// 当传入模型，重写这个方法
- (void)setItems:(NSArray *)items {
    _items = items;
    // 快速遍历
    for (UITabBarItem * btn in items) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        [button setBackgroundImage:btn.image forState:UIControlStateNormal];
        [button setBackgroundImage:btn.selectedImage forState:UIControlStateSelected];
        
        [self addSubview:button];
    }
}

// 需要定义控件位置大小的时候
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 重新定义控件大小
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width / self.items.count;
    CGFloat h = self.bounds.size.height;
    for (NSInteger i = 0; i<self.subviews.count; i++) {
        UIButton * btn = self.subviews[i];
        x = i * w ;
        btn.frame = CGRectMake(x, y, w, h);
    }
}
@end
