//
//  BSBDJRecommendTagsController.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/11/9.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJRecommendTagsController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import "BSBDJRecommendTag.h"
#import "BSBDJRecommendTagsCell.h"

@interface BSBDJRecommendTagsController ()
/**  标签数据  */
@property (nonatomic, strong) NSArray * tags;
@end

static NSString * const TagsID = @"tag";

@implementation BSBDJRecommendTagsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([BSBDJRecommendTagsCell class]) bundle:nil] forCellReuseIdentifier:TagsID];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    //  请求参数
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    //  发送请求
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        edaifuLog(@"%@",responseObject);
        
        [SVProgressHUD dismiss];
        
        self.tags = [BSBDJRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BSBDJRecommendTagsCell * cell = [tableView dequeueReusableCellWithIdentifier:TagsID];
    
    cell.recommendTag = self.tags[indexPath.row];
    
    return cell;
}


@end
