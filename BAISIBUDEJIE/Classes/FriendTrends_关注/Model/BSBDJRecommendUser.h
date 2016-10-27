//
//  BSBDJRecommendUser.h
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/27.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSBDJRecommendUser : NSObject
/**  头像  */
@property (nonatomic, copy) NSString * header;
/**  粉丝数  */
@property (nonatomic, assign) NSInteger fans_count;
/**  昵称  */
@property (nonatomic, copy) NSString * screen_name;

@end
