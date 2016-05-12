//
//  UIImage+Image.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

// 默认不需要系统渲染图片
+ (instancetype)imageWithRenderingOriginalImage:(NSString *)imageName {
    // 系统会默认渲染图片为蓝色
    UIImage * image = [UIImage imageNamed:imageName];
    // 设置为不要系统渲染
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

// 拉伸图片
+ (instancetype)imageStrechableWithImageName:(NSString *)imageName {
    
    UIImage * image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
