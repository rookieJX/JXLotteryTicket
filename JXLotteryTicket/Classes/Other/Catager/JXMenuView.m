//
//  JXMenuView.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXMenuView.h"
#import "JXMenuModel.h"
#import "UIView+Frame.h"
#define kCols 3
@implementation JXMenuView

- (void)setItems:(NSArray *)items {
    _items = items;

    for (JXMenuModel * model in items) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:model.image forState:UIControlStateNormal];
        [button setTitle:model.title forState:UIControlStateNormal];
        [self addSubview:button];
    }
    
}

// 重新布局
- (void)layoutSubviews {
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.width / kCols;
    CGFloat h = w;
    NSInteger col = 0;
    NSInteger row = 0;
    
    for (NSInteger i = 0; i<self.items.count; i++) {
        UIButton * button = self.subviews[i];
        
        col = i % kCols;
        row = i / kCols;
        
        x = col * w;
        y = row * h;
        
        button.frame = CGRectMake(x, y, w, h);
    }
}
@end
