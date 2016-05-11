//
//  JXTabBar.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXTabBar.h"
#import "JXTabBarButton.h"

@interface JXTabBar ()
/** 自定义button,用来保存当前按钮状态 */
@property (nonatomic,weak) JXTabBarButton * tabBarBtn;
@end


@implementation JXTabBar

// 我们自己的tabBar的按钮也需要模型，UITabBar上的按钮交给UITabBarItem
// 当传入模型，重写这个方法
- (void)setItems:(NSArray *)items {
    _items = items;
    // 快速遍历
    for (UITabBarItem * btn in items) {

        JXTabBarButton * button = [JXTabBarButton buttonWithType:UIButtonTypeCustom];
        
        // 设置tag值
        button.tag = self.subviews.count;
        
        button.backgroundColor = [UIColor redColor];
        [button setBackgroundImage:btn.image forState:UIControlStateNormal];
        [button setBackgroundImage:btn.selectedImage forState:UIControlStateSelected];
        // 监听点击事件，点击后跳转到相对应的子控制器
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:button];
        
        // 默认第一个为选中状态
        if (self.subviews.count == 1) { // 当子控件为1的时候说明是第一个按钮
            [self btnClick:button];
        }
    }
}

#pragma mark - 按钮点击事件
- (void)btnClick:(JXTabBarButton *)btn {
    // 点击的时候将上一个按钮取消高亮状态
    self.tabBarBtn.selected = NO;
    // 当前按钮至于高亮状态
    btn.selected = YES;
    self.tabBarBtn = btn;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:btnClick:)]) {
        // 传递其tag值
        [self.delegate tabBar:btn btnClick:btn.tag];
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
