//
//  BSBDJRecommendViewController.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/27.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJRecommendViewController.h"

#import <AFNetworking.h>

#import <SVProgressHUD.h>

#import "BSBDJRecommendCategoryCell.h"

#import <MJExtension.h>

#import "BSBDJRecommendCategory.h"

#import "BSBDJRecommendUserCell.h"

#import "BSBDJRecommendUser.h"

#import <MJRefresh.h>

#define edaifuSelectedCategory  self.categories[self.categoryTableView.indexPathForSelectedRow.row]

@interface BSBDJRecommendViewController ()  <UITableViewDelegate,UITableViewDataSource>
/**  左边的类别数据  */
@property (nonatomic, strong) NSArray * categories;
/** 左边的类别表格 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 右侧的用户表格 */
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
/**  请求参数  */
@property (nonatomic, strong) NSMutableDictionary * params;
/**  AFN请求管理者  */
@property (nonatomic, strong) AFHTTPSessionManager * manager;
@end

@implementation BSBDJRecommendViewController

static NSString * const edaifuCategoryId = @"category";
static NSString * const edaifuUserId = @"user";

-(AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //  空间初始化
    [self setupTableView];
    
    //  添加刷新控件
    [self setupRefresh];
    
    //  加载左侧类别数据
    [self loadCategories];
    
}

/**
 *  加载左侧类别数据
 */
- (void)loadCategories
{
    //  显示指示器
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //  发送请求
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:@{@"a":@"category",@"c":@"subscribe"} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //  隐藏指示器
        [SVProgressHUD dismiss];
        
        //        edaifuLog(@"%@",responseObject);
        
        self.categories = [BSBDJRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //  刷新表格
        [self.categoryTableView reloadData];
        
        //  默认选中首行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //  让用户表格进入下拉刷新状态
        [self.userTableView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //  隐藏指示器
        //        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:@"推荐关注加载失败！"];
    }];
}

/**
 *  控件初始化
 */
-(void)setupTableView
{
    //  注册
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSBDJRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:edaifuCategoryId];
    
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSBDJRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:edaifuUserId];
    
    //  设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70;
    
    //  设置标题
    self.navigationItem.title = @"推荐关注";
    
    //  设置背景色
    self.view.backgroundColor = edaifuGlobalBGColor;
}

/**
 *  添加刷新控件
 */
-(void)setupRefresh
{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
    
    self.userTableView.mj_footer.hidden = YES;
}

- (void)loadNewUsers
{
    BSBDJRecommendCategory * rc = edaifuSelectedCategory;
    
    //  设置当前页码
    rc.current_page = 1;
    
    //  请求参数
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(rc.id);
    params[@"page"] = @(rc.current_page);
    self.params = params;
    
    //  发送请求给服务器，加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //  字典数组 -> 模型数组
        NSArray * users = [BSBDJRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //  先清除所有旧数据
        [rc.users removeAllObjects];
        
        //  添加到当前类别对应的用户数组中
        [rc.users addObjectsFromArray:users];
        
        //  保存总数
        rc.total = [responseObject[@"total"] integerValue];
        
        //  不是最后一次请求
        if (self.params != params) return;
        
        //  刷新右边表格
        [self.userTableView reloadData];
        
        //  结束刷新
        [self.userTableView.mj_header endRefreshing];
        
        //  让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        //  提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        //  结束刷新
        [self.userTableView.mj_header endRefreshing];
    }];
}

#pragma mark - 加载用户数据
- (void)loadMoreUsers
{
    BSBDJRecommendCategory * category = edaifuSelectedCategory;
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(category.id);
    params[@"page"] = @(++category.current_page);
    self.params = params;
    
    //  发送请求给服务器，加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //  字典数组 -> 模型数组
        NSArray * users = [BSBDJRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //  添加到当前类别对应的用户数组中
        [category.users addObjectsFromArray:users];
        
        //  不是最后一次请求
        if (self.params != params) return;
        
        //  刷新右边表格
        [self.userTableView reloadData];
        
        //  让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        //  提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        //  让底部控件结束刷新
        [self.userTableView.mj_footer endRefreshing];
        
    }];
}

/**
 *  时刻监测footer的状态
 */
- (void)checkFooterState
{
    BSBDJRecommendCategory * rc = edaifuSelectedCategory;
    
    //  每次刷新右边数据时，都控制footer显示或者隐藏
    self.userTableView.mj_footer.hidden = (rc.users.count == 0);
    
    //  让底部控件结束刷新
    if (rc.users.count == rc.total) {// 全部数据已经加载完毕
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else {//   还没有加载完毕
        [self.userTableView.mj_footer endRefreshing];
    }
}

#pragma mark - <UITableViewDataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    左边的类别表格
    if (tableView == self.categoryTableView) return self.categories.count;
    
    //  监测footer的状态
    [self checkFooterState];
    
    //  右边的用户表格
    return [edaifuSelectedCategory users].count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {//    左边的类别表格
        BSBDJRecommendCategoryCell * cell = [tableView dequeueReusableCellWithIdentifier:edaifuCategoryId];
        
        
        cell.category = self.categories[indexPath.row];
        
        return cell;
    }else {//   右边的用户表格
        BSBDJRecommendUserCell * cell = [tableView dequeueReusableCellWithIdentifier:edaifuUserId];
        
//        BSBDJRecommendCategory * category = self.categories[self.categoryTableView.indexPathForSelectedRow.row];
        
        cell.user = [edaifuSelectedCategory users][indexPath.row];
        
        return cell;
    }
}

#pragma mark - <UITableViewDelegate>
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  结束刷新
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    
    BSBDJRecommendCategory * category = self.categories[indexPath.row];
    
    [self.userTableView.mj_footer endRefreshing];
    
    if (category.users.count) {
        //  显示曾经的数据
        [self.userTableView reloadData];
    }else {
        //  赶紧刷新表格，目的是：马上显示当前category的用户数据，不让用户看见上一个category的残留数据
        [self.userTableView reloadData];
        
        //  进入下拉刷新状态，刷新右边的表格
        [self.userTableView.mj_header beginRefreshing];
        
    }
    
}

#pragma mark - 控制器的销毁
-(void)dealloc
{
    //  停止所有的操作
    [self.manager.operationQueue cancelAllOperations];
    //  另一种做法：找到GET方法里(NSURLSessionDataTask *)调用cancel方法
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
