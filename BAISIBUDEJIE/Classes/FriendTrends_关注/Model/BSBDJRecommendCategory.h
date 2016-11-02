//
//  BSBDJRecommendCategory.h
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/27.
//  Copyright © 2016年 zhurui. All rights reserved.
//  推荐关注左边数据模型

#import <Foundation/Foundation.h>

@interface BSBDJRecommendCategory : NSObject

/**  id  */
@property (nonatomic, assign) NSInteger id;

/**  总数  */
@property (nonatomic, assign) NSInteger count;

/**  名字  */
@property (nonatomic, copy) NSString * name;


/**  这个类别对应的用户数据  */
@property (nonatomic, strong) NSMutableArray * users;

/**  总数  */
@property (nonatomic, assign) NSInteger total;

/**  当前页码  */
@property (nonatomic, assign) NSInteger current_page;

@end
