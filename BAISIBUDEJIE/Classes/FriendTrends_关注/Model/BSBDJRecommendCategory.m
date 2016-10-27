//
//  BSBDJRecommendCategory.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/27.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "BSBDJRecommendCategory.h"

@implementation BSBDJRecommendCategory

-(NSMutableArray *)users
{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end
