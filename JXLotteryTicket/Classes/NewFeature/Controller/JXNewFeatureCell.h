//
//  JXNewFeatureCell.h
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/13.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JXNewFeatureCell : UICollectionViewCell
/** 图片 */
@property (nonatomic,strong) UIImage * image;

- (void)showButtonIndex:(NSIndexPath *)index count:(NSInteger)count;
@end
