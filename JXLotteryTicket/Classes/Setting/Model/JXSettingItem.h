//
//  JXSettingItem.h
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/16.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXSettingItem : NSObject
/** 图片 */
@property (nonatomic,strong) UIImage * image;
/** 标题 */
@property (nonatomic,strong) NSString * title;
/** 子标题 */
@property (nonatomic,strong) NSString * subTitle;

+ (instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle;
@end
