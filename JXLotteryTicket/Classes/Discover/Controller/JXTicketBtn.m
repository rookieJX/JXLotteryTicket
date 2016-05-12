//
//  JXTicketBtn.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/12.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXTicketBtn.h"

@implementation JXTicketBtn


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat titleX = self.titleLabel.width;
    CGFloat imageX = self.imageView.x;
    if (self.imageView.x < self.titleLabel.x) { // 当图片在文字左边的时候调用
        self.titleLabel.x = imageX;
        self.imageView.x = titleX;
    }

}
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    // 自适应，自动计算宽度高度
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
