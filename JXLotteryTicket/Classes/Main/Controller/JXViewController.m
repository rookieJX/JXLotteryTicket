//
//  JXViewController.m
//  JXLotteryTicket
//
//  Created by 王加祥 on 16/5/10.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXViewController.h"
#import "JXNavigationController.h"

#import "JXArenaViewController.h"
#import "JXDiscoverViewController.h"
#import "JXHallViewController.h"
#import "JXHistoryViewController.h"
#import "JXMyLotteryViewController.h"
#import "JXArenaNavController.h"
#import "JXTabBar.h"

@interface JXViewController ()<JXTabBarDelegate>

/** 用来记录保存到当前控件的子控制器的UITabBarItem */
@property (nonatomic,strong) NSMutableArray * items;

@end

@implementation JXViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupAllChildController];
    
    [self setupTabBar];
}

#pragma mark - 懒加载
- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - 设置tabBar
- (void)setupTabBar {
    // 先将原tabBar移除
    // 这里如果移除系统的tabBar，在之后跳转的时候隐藏就会有问题，我们就需要自己写隐藏动画
//    [self.tabBar removeFromSuperview];
    
    JXTabBar * tabBar = [[JXTabBar alloc] init];
    // 设置tabBar的尺寸
    // 这里虽然已经移除了self.tabBar，但是并没有立即消失，是等到再次循环到这个地方才会消失，所以我们这里扔可以得到这部分的尺寸
    // 把一个控件移除父控件并不会马上销毁，一般在下一次运行循环的时候，就会判断这个对象有没有强引用，如果没有，才会销毁。
    tabBar.frame = self.tabBar.bounds;
    tabBar.items = self.items;
    // 设置代理
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 删除系统tabBar子控件
    for (UIView * childView in self.tabBar.subviews) {
        // 判断是否是我们自定义的类,如果不是
        if (![childView isKindOfClass:[JXTabBar class]]) {
            // 将之移除
            [childView removeFromSuperview];
        }
    }
}

#pragma mark - JXTabBarDelegate
- (void)tabBar:(JXTabBarButton *)btn btnClick:(NSInteger)index {
    // 选中
    self.selectedIndex = index;
}
#pragma mark - 设置所有的子控制器
// tabBar上面按钮的图片尺寸是由规定，不能超过44,超过之后就不能显示，这里我们使用自定义tabBar
- (void)setupAllChildController {
    
    // 购票大厅
    JXHallViewController * hall = [[JXHallViewController alloc] init];
    [self setupAddOneChildController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"]selectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购票大厅"];
    
    
    // 竞技场
    JXArenaViewController * arena = [[JXArenaViewController alloc] init];
    [self setupAddOneChildController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selectedImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:nil];
    
    // 发现
    // 采用storyBoard设置
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"JXDiscoverViewController" bundle:nil];
    JXDiscoverViewController * discover = [storyBoard instantiateInitialViewController];
    [self setupAddOneChildController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 开奖信息
    JXHistoryViewController * history = [[JXHistoryViewController alloc] init];
    [self setupAddOneChildController:history image:[UIImage imageNamed:@"TabBar_History_new"] selectedImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 我的彩票
    JXMyLotteryViewController * myLottery = [[JXMyLotteryViewController alloc] init];
    [self setupAddOneChildController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectedImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}

#pragma mark - 设置添加单个子控制器
- (void)setupAddOneChildController:(UIViewController *)controller image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    // 正常状态下的图片
    controller.tabBarItem.image = image;
    // 随机颜色
//    controller.view.backgroundColor = [self randColor];
    // 选中状态下的图片
    controller.tabBarItem.selectedImage = selectedImage;
    // 将tabBar保存到数组中
    [self.items addObject:controller.tabBarItem];
    
    // 设置导航栏
    // 父类的子针可以指向指针对象
    UINavigationController * nav = [[JXNavigationController alloc] initWithRootViewController:controller];
    // 设置导航栏标题
    controller.navigationItem.title = title;
    // 如果要设置背景图片，必须填UIBarMetricsDefault,默认导航控制器的子控制器的view尺寸会变化。
    // 设置导航条背景图片，一定要在导航条显示之前设置
    // 直接在子控制器上的viewDidLoad这个方法中使用的话，因为控制器的view都是懒加载，所以在使用的时候，设置导航栏背景是无用的
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];

    
    // 判断是否是竞技场类
    if ([controller isKindOfClass:[JXArenaViewController class]]) {
        nav = [[JXArenaNavController alloc] initWithRootViewController:controller];
    }
    
    
    // 添加到tabBar的子控制器上
    [self addChildViewController:nav];
}

#pragma mark - 随机色
- (UIColor *)randColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
@end
