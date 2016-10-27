
//
//  BSBDJFriendTrendsViewController.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 16/8/30.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJFriendTrendsViewController.h"

#import "BSBDJRecommendViewController.h"

@interface BSBDJFriendTrendsViewController ()

@end

@implementation BSBDJFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    //  initWithImage好处：imageview的尺寸和图片一样
    self.navigationItem.title = @"我的关注";
    
    //  设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highlightImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    self.view.backgroundColor = edaifuGlobalBGColor;
    
    edaifuLogFunc;
}

- (void)friendsClick
{
    edaifuLogFunc;
    
    BSBDJRecommendViewController * recommend = [[BSBDJRecommendViewController alloc] init];
    [self.navigationController pushViewController:recommend animated:YES];
    
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
