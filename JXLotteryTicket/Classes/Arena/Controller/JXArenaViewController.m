//
//  JXArenaViewController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXArenaViewController.h"



@interface JXArenaViewController ()

@end

@implementation JXArenaViewController

// 重写，自定义控制器view
- (void)loadView {
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:JXBouns];
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    // 打开交互
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl * ment = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    [ment setBackgroundImage:[UIImage imageWithRenderingOriginalImage:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [ment setBackgroundImage:[UIImage imageWithRenderingOriginalImage:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    ment.selectedSegmentIndex = 0;
    // 设置边框颜色以及文字颜色
    ment.tintColor = JXColor(0, 142, 143);
    // 改变宽度
    ment.width += 40;
    self.navigationItem.titleView = ment;
    
}



@end
