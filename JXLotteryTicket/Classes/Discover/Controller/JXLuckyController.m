//
//  JXLuckyController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/12.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXLuckyController.h"

@interface JXLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation JXLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image1 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage * image2 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    self.imageView.animationImages = @[image1,image2];
    
    self.imageView.animationDuration = 1;
    [self.imageView startAnimating];
}



@end
