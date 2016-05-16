//
//  JXBaseViewController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXBaseViewController.h"
#import "JXSettingCell.h"
@interface JXBaseViewController ()


@end

@implementation JXBaseViewController
- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JXSettingGroupItems * group = self.groups[section];
    return group.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 快速创建cell
    JXSettingCell * cell = [JXSettingCell cellWithTableView:tableView];
    
    JXSettingGroupItems * group = self.groups[indexPath.section];
    
    JXSettingItem * item = group.items[indexPath.row];
    // 封装数据模型
    cell.cellItem = item;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JXSettingGroupItems * group = self.groups[indexPath.section];
    JXSettingItem * item = group.items[indexPath.row];
    if (item.itemBlock) {
        item.itemBlock(indexPath);
        return;
    }
    
    if ([item isKindOfClass:[JXArrowSettingItem class]]) {
        JXArrowSettingItem * arrowItem = (JXArrowSettingItem *)item;
        __weak typeof(self) weakSelf = self;
        if (arrowItem.nameVc) {
            // 需要跳转类
            UIViewController * vc = [[arrowItem.nameVc alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    JXSettingGroupItems * group = self.groups[section];
    return group.headTitle;
}

#pragma mark - 懒加载
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}
@end