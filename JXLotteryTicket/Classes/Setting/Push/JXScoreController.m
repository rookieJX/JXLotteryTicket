//
//  JXScoreController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXScoreController.h"
#import "JXArrowSettingItem.h"
#import "JXSettingGroupItems.h"
@interface JXScoreController ()

@end

@implementation JXScoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup0];
    
    [self setup1];
    
    [self setup1];
    
    [self setup1];
    
    [self setup1];
    
    [self setup1];
    
    [self setup1];
    
}

- (void)setup0 {
    JXArrowSettingItem * item = [JXArrowSettingItem settingItemWithImage:nil title:@"不知道设置什么鬼" subTitle:nil];
    JXArrowSettingItem * item1 = [JXArrowSettingItem settingItemWithImage:nil title:@"你咋不上天" subTitle:nil];
    JXArrowSettingItem * item2 = [JXArrowSettingItem settingItemWithImage:nil title:@"你咋不和太阳肩并肩" subTitle:nil];
    JXArrowSettingItem * item3 = [JXArrowSettingItem settingItemWithImage:nil title:@"不知道设置什么鬼" subTitle:nil];
    NSArray * array = @[item,item1,item2,item3];
    
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:@"阁下何不随风起，随风直上九万里" footerTitle:nil];
    [self.groups addObject:group];
}

- (void)setup1 {
    JXArrowSettingItem * item = [JXArrowSettingItem settingItemWithImage:nil title:@"不知道设置什么鬼" subTitle:@"00:00"];
    // 在block中容易造成循环引用
    __weak typeof(self) weakSelf = self;
    item.itemBlock = ^(NSIndexPath * indexPath){
        UITableViewCell * cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        // 弹出键盘
        UITextField * textField = [[UITextField alloc] init];
        [textField becomeFirstResponder];
        // 会自动调用自适应键盘
        [cell addSubview:textField];
    };
    JXArrowSettingItem * item1 = [JXArrowSettingItem settingItemWithImage:nil title:@"你咋不上天" subTitle:nil];
    JXArrowSettingItem * item2 = [JXArrowSettingItem settingItemWithImage:nil title:@"你咋不和太阳肩并肩" subTitle:nil];
    JXArrowSettingItem * item3 = [JXArrowSettingItem settingItemWithImage:nil title:@"不知道设置什么鬼" subTitle:nil];
    NSArray * array = @[item,item1,item2,item3];
    
    JXSettingGroupItems * group = [JXSettingGroupItems settingGroupItems:array headTitle:@"阁下何不随风起，随风直上九万里" footerTitle:nil];
    [self.groups addObject:group];
}

@end
