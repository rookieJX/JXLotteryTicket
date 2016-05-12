//
//  JXMenuView.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXMenuView.h"
#import "JXMenuModel.h"
#define kCols 3
@interface JXMenuView ()

/** 模型列表 */
@property (nonatomic,strong) NSArray * items;
/** UIButton控件 */
@property (nonatomic,strong) NSMutableArray * array;
@end

@implementation JXMenuView

/**
 *  隐藏
 */
- (void)hide {
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

/**
 *  显示
 *
 *  @param items       显示的图标数组
 *  @param originPoint 显示的位置
 *
 */
+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items originPoint:(CGPoint)originPoint{
    JXMenuView * menu = [[JXMenuView alloc] init];
    
    // 在类方法中，不能直接访问属性
    menu.items = items;
    
    // 计算行数
    NSInteger row = (items.count - 1)/kCols + 1;
    // 宽度,高度
    CGFloat w = JXWidth / kCols;
    CGFloat h = w * row;
    // 设置背景尺寸
    menu.frame = CGRectMake(originPoint.x, originPoint.y, JXWidth, h);
    menu.backgroundColor = [UIColor purpleColor];
    
    // 添加按钮 self在这里代JXMenuView
    [menu setupAllBtns];
    
    [menu setupAllDivide];
    
    [menu popViewAnimation:menu superView:superView];
    
    // 这里原方案是直接添加到主程序的窗口上，但是当做动画弹出的时候回覆盖导航栏，所以这里需要添加到导航栏下方
    [superView addSubview:menu];
    
    return menu;
}
#pragma mark - 弹出动画
- (void)popViewAnimation:(UIView *)popView superView:(UIView *)superView{
    
    // 因为在弹出的时候回往下拉一部分，这时候会显露后面的背景.我们可以提前设置一个背景
    UIView * backView = [[UIView alloc] initWithFrame:popView.frame];
    backView.backgroundColor = popView.backgroundColor;
    [superView addSubview:backView];
    
    // 先将需要弹出的动画位置偏移
    popView.transform = CGAffineTransformMakeTranslation(0, -popView.height);
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        popView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        // 弹出完成之后移除控件
        [backView removeFromSuperview];
    }];
}
#pragma mark - 添加分割线
- (void)setupAllDivide {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 1;
    CGFloat h = JXWidth / kCols;
    NSInteger col = 0;
    NSInteger row = 0;
    // 添加竖线,在每一个UIButton上添加竖线
    for (NSInteger i = 0; i< self.items.count ; i++) {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        col = i % kCols;
        row = i / kCols;
        x = (col + 1) * h;
        y = row * h;
        view.frame = CGRectMake(x, y, w, h);
        [self addSubview:view];
    }
    
    // 添加横线
    w = JXWidth;
    h = 1;
    x = 0;
    row = (self.array.count - 1) / kCols ;
    for (NSInteger i = 0; i < row ; i++) {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        col = i % kCols;
        y = (i + 1) * JXWidth / kCols;
        view.frame = CGRectMake(x, y, w, h);
        [self addSubview:view];
    }
}

#pragma mark - 添加子控件
- (void)setupAllBtns {
    for (JXMenuModel * item in self.items) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:item.image forState:UIControlStateNormal];
        [button setTitle:item.title forState:UIControlStateNormal];
        // 将子控件放到数组里面
        [self.array addObject:button];
        [self addSubview:button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局所有按钮
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = JXWidth / kCols;
    CGFloat h = w;
    NSInteger col = 0;
    NSInteger row = 0;
    for (NSInteger i = 0; i<self.items.count; i++) {
        // 添加横竖线，这里会有问题，
        UIButton * button = self.array[i];
        col = i % kCols;
        row = i / kCols;
        x = col * w;
        y = row * h;
        button.frame = CGRectMake(x, y, w, h);
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)array {
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
@end
