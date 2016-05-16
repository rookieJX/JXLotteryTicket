//
//  JXNewFeatureCell.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/13.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXNewFeatureCell.h"
#import "JXViewController.h"

@interface JXNewFeatureCell ()

/** 图片属性 */
@property (nonatomic,weak) UIImageView * imageView;
/** 按钮 */
@property (nonatomic,strong) UIButton * button;

@end

@implementation JXNewFeatureCell

- (UIImageView *)imageView {
    if (_imageView == nil) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView = imageView;
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

- (void)showButtonIndex:(NSIndexPath *)index count:(NSInteger)count {
    if (index.row == count-1) {
        [self.contentView addSubview:self.button];
    }
}

- (UIButton *)button {
    if (_button == nil) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage * image = [UIImage imageNamed:@"guideStart"];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button sizeToFit];
        button.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        _button = button;
        
    }
    return _button;
}


- (void)btnClick:(UIButton *)btn {
    JXKeyWindow.rootViewController = [[JXViewController alloc] init];
    
    // 添加动画
    CATransition * animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = @"rippleffect";
    [JXKeyWindow.layer addAnimation:animation forKey:nil];
}
@end
