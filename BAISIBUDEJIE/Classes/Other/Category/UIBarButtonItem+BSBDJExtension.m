//
//  UIBarButtonItem+BSBDJExtension.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 2016/10/26.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "UIBarButtonItem+BSBDJExtension.h"

@implementation UIBarButtonItem (BSBDJExtension)
+(instancetype)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}
@end
