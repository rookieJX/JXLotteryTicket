//
//  JXHelpController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/17.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXHelpController.h"
#import "JXHtmlItem.h"

@interface JXHelpController ()
/** 保存数组 */
@property (nonatomic,strong) NSMutableArray * items;
@end

@implementation JXHelpController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self items];
}

- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData * data = [NSData dataWithContentsOfFile:path];
        // 解析JSON
        NSArray * dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary * dict in dictArr) {
            JXHtmlItem * html = [JXHtmlItem htmlItemWithDict:dict];
            [_items addObject:html];
        }
        
    }
    return _items;
}
@end
