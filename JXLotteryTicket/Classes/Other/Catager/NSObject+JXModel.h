//
//  NSObject+JXModel.h
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//  解析字典中数组模型

#import <Foundation/Foundation.h>

@interface NSObject (JXModel)


// 快速进行字典转模型
// mapDict:模型中的哪个属性名跟字典里面的key对应
+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
