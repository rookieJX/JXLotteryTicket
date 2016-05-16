//
//  JXSettingController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSettingController.h"
#import "JXSettingItem.h"
#import "JXSettingGroupItems.h"


@interface JXSettingController ()
/** 一共有多少组 */
@property (nonatomic,strong) NSMutableArray * items;
@end

@implementation JXSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup0];
    
    [self setupGroup1];
    
    [self setupGroup2];
}

- (void)setupGroup0 {
    JXSettingItem * item = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    NSArray * array = @[item];
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:@"测试标题1" footerTitle:nil];
    [self.items addObject:group];
}

- (void)setupGroup1 {
    JXSettingItem * item = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXSettingItem * item1 = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXSettingItem * item2 = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    NSArray * array = @[item,item1,item2];
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:nil footerTitle:nil];
    [self.items addObject:group];
}
- (void)setupGroup2 {
    JXSettingItem * item = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXSettingItem * item1 = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXSettingItem * item2 = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    JXSettingItem * item3 = [JXSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码" subTitle:nil];
    NSArray * array = @[item,item1,item2,item3];
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:nil footerTitle:nil];

    [self.items addObject:group];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JXSettingGroupItems * group = self.items[section];
    return group.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    JXSettingGroupItems * group = self.items[indexPath.section];
    JXSettingItem * item = group.items[indexPath.row];
    cell.imageView.image = item.image;
    cell.textLabel.text = item.title;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    JXSettingGroupItems * group = self.items[section];
    return group.headTitle;
}
- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end