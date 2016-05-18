//
//  JXHtmlItem.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JXHtmlItem : NSObject
/** 标题 */
@property (nonatomic,strong) NSString * title;
/** HTML */
@property (nonatomic,strong) NSString * html;
/** ID */
@property (nonatomic,strong) NSString * ID;

+ (instancetype)htmlItemWithDict:(NSDictionary *)dict;
@end
