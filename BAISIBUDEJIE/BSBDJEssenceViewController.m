//
//  BSBDJEssenceViewController.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 16/8/30.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJEssenceViewController.h"

@interface BSBDJEssenceViewController ()

@end

@implementation BSBDJEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    //  initWithImage好处：imageview的尺寸和图片一样
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //  设置导航栏左边的按钮
    UIButton * tagbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagbutton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [tagbutton setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    tagbutton.size = tagbutton.currentBackgroundImage.size;
    [tagbutton addTarget:self action:@selector(tagClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tagbutton];
}

- (void)tagClick
{
    edaifuLog(@"%s",__func__);
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
