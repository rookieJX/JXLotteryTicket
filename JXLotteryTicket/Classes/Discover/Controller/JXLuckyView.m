//
//  JXLuckyView.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/12.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXLuckyView.h"

@implementation JXLuckyView

- (void)drawRect:(CGRect)rect {
    
    UIImage * image = [UIImage imageNamed:@"luck_entry_background"];
    [image drawInRect:rect];
    
}

@end
