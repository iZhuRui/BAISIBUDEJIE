//
//  UIBarButtonItem+BSBDJExtension.h
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/26.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BSBDJExtension)
+ (instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;
@end
