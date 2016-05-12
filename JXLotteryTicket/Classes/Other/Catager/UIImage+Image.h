//
//  UIImage+Image.h
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
+ (instancetype)imageWithRenderingOriginalImage:(NSString *)imageName;

+ (instancetype)imageStrechableWithImageName:(NSString *)imageName;
@end
