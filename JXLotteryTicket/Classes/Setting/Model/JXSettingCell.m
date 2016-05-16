//
//  JXSettingCell.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXSettingCell.h"
#import "JXSettingItem.h"

#import "JXArrowSettingItem.h"
#import "JXSwitchSettingItem.h"

@interface JXSettingCell ()

/** 辅助视图箭头按钮 */
@property (nonatomic,strong) UIImageView * arrowView;
/** 开关按钮 */
@property (nonatomic,strong) UISwitch * switchView;
@end

@implementation JXSettingCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString * identifier = @"cell";
    
    JXSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[JXSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)setCellItem:(JXSettingItem *)cellItem {
    _cellItem = cellItem;
    
    // 设置控件内容
    [self setUpData];
    
    // 设置辅助视图
    [self setUpAssessory];
}

- (void)setUpData {
    
    self.imageView.image = self.cellItem.image;
    self.textLabel.text = self.cellItem.title;
    self.detailTextLabel.text = self.cellItem.subTitle;
}

- (void)setUpAssessory {
    if ([self.cellItem isKindOfClass:[JXArrowSettingItem class]]) {
        // 点击可以进入详情
        self.accessoryView = self.arrowView;
    } else if ([self.cellItem isKindOfClass:[JXSwitchSettingItem class]]) {
        // 按钮
        self.accessoryView = self.switchView;
        // 取消选中按钮
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        // 为了复用，这里需要还原
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
    }
}

#pragma mark - 懒加载
- (UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    return _arrowView;
}
@end
