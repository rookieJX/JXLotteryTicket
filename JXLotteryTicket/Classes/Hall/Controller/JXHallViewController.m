//
//  JXHallViewController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXHallViewController.h"
#import "JXMenuModel.h"
#import "JXMenuView.h"
#import "UIImage+Image.h"
#import "UIView+Frame.h"

@interface JXHallViewController ()

/** 存放item属性 */
@property (nonatomic,strong) NSMutableArray * items;

@end

@implementation JXHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBtn];
}

#pragma mark - 添加导航栏按钮
- (void)setupNavigationBtn {
    // 添加左边按钮
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingOriginalImage:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem = leftButtonItem;

    // 添加右边按钮
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingOriginalImage:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popMenu:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;

}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)barItem {
    NSLog(@"%s",__func__);
}

- (void)popMenu:(UIBarButtonItem *)barItem {
    JXMenuModel * model1 = [JXMenuModel menuModelImage:[UIImage imageNamed:@"Development"] title:nil];
    JXMenuModel * model2 = [JXMenuModel menuModelImage:[UIImage imageNamed:@"Development"] title:nil];
    JXMenuModel * model3 = [JXMenuModel menuModelImage:[UIImage imageNamed:@"Development"] title:nil];
    JXMenuModel * model4 = [JXMenuModel menuModelImage:[UIImage imageNamed:@"Development"] title:nil];
    JXMenuModel * model5 = [JXMenuModel menuModelImage:[UIImage imageNamed:@"Development"] title:nil];
    JXMenuModel * model6 = [JXMenuModel menuModelImage:[UIImage imageNamed:@"Development"] title:nil];
    NSArray * array = @[model1,model2,model3,model4,model5,model6];
    
    JXMenuView * view = [[JXMenuView alloc] init];
    view.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    view.backgroundColor = [UIColor purpleColor];
    view.items = array;
    [self.view addSubview:view];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

#pragma mark - 懒加载
- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
