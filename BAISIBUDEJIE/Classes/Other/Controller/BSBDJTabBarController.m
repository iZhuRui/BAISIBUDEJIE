//
//  BSBDJTabBarController.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 16/8/30.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJTabBarController.h"

#import "BSBDJEssenceViewController.h"

#import "BSBDJNewViewController.h"

#import "BSBDJFriendTrendsViewController.h"

#import "BSBDJMeViewController.h"

#import "BSBDJTabBar.h"

@interface BSBDJTabBarController ()

@end

@implementation BSBDJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  通过appearance统一设置所有uitabbaritem的文字属性
    //  后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs                    = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName]                    = [UIFont systemFontOfSize:12.0];
    attrs[NSForegroundColorAttributeName]         = [UIColor grayColor];

    NSMutableDictionary *selectedAttrs            = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName]            = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];

    UITabBarItem *item                            = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    //  添加子控制器
    [self setupChildVC:[[BSBDJEssenceViewController alloc] init]
                 title:@"精华"
                 image:@"tabBar_essence_icon"
         selectedImage:@"tabBar_essence_click_icon"];

    [self setupChildVC:[[BSBDJNewViewController alloc] init]
                 title:@"新帖"
                 image:@"tabBar_new_icon"
         selectedImage:@"tabBar_new_click_icon"];

    [self setupChildVC:[[BSBDJFriendTrendsViewController alloc] init]
                 title:@"关注"
                 image:@"tabBar_friendTrends_icon"
         selectedImage:@"tabBar_friendTrends_click_icon"];

    [self setupChildVC:[[BSBDJMeViewController alloc] init]
                 title:@"我"
                 image:@"tabBar_me_icon"
         selectedImage:@"tabBar_me_click_icon"];
    
    
    
//    self.tabBar = [[BSBDJTabBar alloc] init];
    //  出现readonly可以使用KVC改
    [self setValue:[[BSBDJTabBar alloc] init] forKeyPath:@"tabBar"];
    
    //  先设置完tabbar再设置图片
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}

/**
 *  初始化子控制器
 */
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //  设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title         = title;
    vc.tabBarItem.image         = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //  这行代码导致四个控制器同时创建，因为要拿到view要先创建viewcontroller，不合理
//    vc.view.backgroundColor     = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0];
    //  包装一个导航栏控制器，添加导航栏控制器为tabbarcontroller的子控制器
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
