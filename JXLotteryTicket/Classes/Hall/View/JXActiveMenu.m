//
//  JXActiveMenu.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXActiveMenu.h"
#import "JXCoverView.h"
@implementation JXActiveMenu

+ (instancetype)activeShow {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

/**
 *  这里我们不能直接添加到coverView上，因为蒙版会设置透明度，我么这个也会有影响，需要再次添加到主程序窗口上
 */

+ (instancetype)showInPoint:(CGPoint)point {
    JXActiveMenu * menu = [JXActiveMenu activeShow];
    // 将活动添加到主窗口上
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    menu.center = point;
    
    [window addSubview:menu];
    
    return menu;
}

+ (void)hideInPoint:(CGPoint)point completion:(void (^)())completin{
    for (JXActiveMenu * view in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([view isKindOfClass:[JXActiveMenu class]]) {
            [view setupHideAnimation:point completion:^{
                if (completin) { // 判断block是否有值
                    completin();
                }
            }];
        }
    }
}
- (IBAction)cancelBtnClick:(UIButton *)sender {

    if (self.delegate && [self.delegate respondsToSelector:@selector(activeMenuDidClickCancel:)]) {
        [self.delegate activeMenuDidClickCancel:self];
    }
}

- (void)setupHideAnimation:(CGPoint)point completion:(void (^)())completin{
    // 当前控件移动到左上角慢慢缩放
    [UIView animateWithDuration:1 animations:^{
        // 修改父控件的frame，并不会影响到子控件,可以使用自动布局约束来影响
        
        // 移动的同事缩放控件
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-self.center.x + point.x, -self.center.y + point.y);
        transform = CGAffineTransformScale(transform, 0.1, 0.1);
        self.transform = transform;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (completin) { // 判断block是否有值
            completin ();
        }
    }];
}


@end
