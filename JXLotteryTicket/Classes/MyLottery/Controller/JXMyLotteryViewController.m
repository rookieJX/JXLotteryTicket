//
//  JXMyLotteryViewController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXMyLotteryViewController.h"
#import "UIImage+Image.h"
@interface JXMyLotteryViewController ()

@end

@implementation JXMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
}

// 设置导航栏
- (void)setupNav {
    // 将左边按钮包装成一个UIView
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [button setTitle:@"客服" forState:UIControlStateNormal];
    
    // 自适应尺寸
    [button sizeToFit];
    // 包装
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    // 设置右边按钮
    // 系统会默认渲染图片为蓝色
    UIImage * image = [UIImage imageWithRenderingOriginalImage:@"Mylottery_config"];
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)rightBtnClick:(UIBarButtonItem *)rightItem {
    
}
@end
