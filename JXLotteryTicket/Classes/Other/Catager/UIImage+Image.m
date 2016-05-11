//
//  UIImage+Image.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (instancetype)imageWithRenderingOriginalImage:(NSString *)imageName {
    // 系统会默认渲染图片为蓝色
    UIImage * image = [UIImage imageNamed:imageName];
    // 设置为不要系统渲染
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
