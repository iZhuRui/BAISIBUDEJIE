//
//  BSBDJRecommendTag.h
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/11/9.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSBDJRecommendTag : NSObject
/**  图片  */
@property (nonatomic, copy) NSString * image_list;
/**  名字  */
@property (nonatomic, copy) NSString * theme_name;
/**  订阅数  */
@property (nonatomic, assign) NSInteger sub_number;
@end
