//
//  JXMenuView.h
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXMenuView : UIView

+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items originPoint:(CGPoint)originPoint;

- (void)hide;
@end
