//
//  JXNavigationController.m
//  JXLotteryTicket
//
//  Created by yuezuo on 16/5/11.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXNavigationController.h"

@interface JXNavigationController ()

@end

@implementation JXNavigationController

// 当前类或者他的子类第一次使用的时候才会调用，而且只会调用一次
+ (void)initialize {
    // 获取当前所有的导航栏
    // 设置导航栏属性，不需要考虑是否存在导航条，只需要执行一次
    // 但是设置这个属性的时候回改变系统的导航栏，例如调用相册的时候，真机调试的时候会有bug
//    UINavigationBar * bar = [UINavigationBar appearance];
//    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 获取哪个类
    UINavigationBar * bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 设置导航栏标题颜色
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    [bar setTitleTextAttributes:dict];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated { // 当导航控制器push的时候回调用这个方法。
    NSLog(@"%s",__func__);
    if (self.viewControllers.count != 0) { // 第一次的时候还没走到super这个方法，所以self.viewControllers.count还是为0，当不为0的时候就隐藏
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 当不是跟控制器的时候设置返回按钮
        UIImage * image = [UIImage imageWithRenderingOriginalImage:@"NavBack"];
        UIBarButtonItem * bar = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
        viewController.navigationItem.leftBarButtonItem = bar;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back:(UIBarButtonItem *)sender {
    [self popViewControllerAnimated:YES];
}
@end
