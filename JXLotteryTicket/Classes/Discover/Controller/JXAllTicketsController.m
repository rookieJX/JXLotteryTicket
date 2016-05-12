//
//  JXAllTicketsController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/12.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXAllTicketsController.h"
#import "JXTicketBtn.h"
@interface JXAllTicketsController ()

@end

@implementation JXAllTicketsController

/**
 *  直接设置背景图片的时候有时候用约束可能会有延迟，这里我们重绘
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    JXTicketBtn * button = [[JXTicketBtn alloc] init];
    
    [button setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [button setTitle:@"全部彩种" forState:UIControlStateNormal];
    [button sizeToFit];
    self.navigationItem.titleView = button;
}



@end
