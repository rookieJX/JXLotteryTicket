//
//  JXHtmlItem.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXHtmlItem.h"
#import "NSObject+JXModel.h"

@implementation JXHtmlItem
+ (instancetype)htmlItemWithDict:(NSDictionary *)dict {
    
    JXHtmlItem * html = [JXHtmlItem objcWithDict:dict mapDict:@{@"ID":@"id"}];
    
//    [html setValuesForKeysWithDictionary:dict];
    // 遍历字典中所有KEY
    return html;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKeyPath:@"ID"];
    } else {
        [super setValue:value forKey:key];
    }
}

@end
