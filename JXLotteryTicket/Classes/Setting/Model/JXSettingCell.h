//
//  JXSettingCell.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JXSettingItem;

@interface JXSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/** cell表格模型 */
@property (nonatomic,strong) JXSettingItem * cellItem;

@end
