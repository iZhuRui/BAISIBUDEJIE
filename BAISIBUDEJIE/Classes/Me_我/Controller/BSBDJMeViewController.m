//
//  BSBDJMeViewController.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 16/8/30.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJMeViewController.h"

@interface BSBDJMeViewController ()

@end

@implementation BSBDJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    //  initWithImage好处：imageview的尺寸和图片一样
    self.navigationItem.title = @"我的";
    
    //  设置导航栏左边的按钮
    UIBarButtonItem * settingButton = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem * nightbutton = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlightImage:@"mine-moon-icon-click" target:self action:@selector(nightClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingButton,nightbutton];
    
    self.view.backgroundColor = edaifuGlobalBGColor;
    
    edaifuLogFunc;
}

- (void)settingClick
{
    edaifuLogFunc;
}

- (void)nightClick
{
    edaifuLogFunc;
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
