//
//  JXMenuModel.h
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JXMenuModel : NSObject
+ (instancetype)menuModelImage:(UIImage *)image title:(NSString *)title;


/** 图片 */
@property (nonatomic,strong) UIImage * image;
/** 标题 */
@property (nonatomic,strong) NSString * title;

@end
