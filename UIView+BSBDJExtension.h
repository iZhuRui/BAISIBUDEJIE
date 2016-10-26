//
//  UIView+BSBDJExtension.h
//  BAISIBUDEJIE
//
//  Created by zhurui on 16/8/30.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BSBDJExtension)
/**  尺寸  */
@property (nonatomic, assign) CGSize size;

/**  宽度  */
@property (nonatomic, assign) CGFloat width ;

/**  高度  */
@property (nonatomic, assign) CGFloat height;

/**  X  */
@property (nonatomic, assign) CGFloat X;//等价于
/*
-(CGFloat)X;
-(void)setX:(CGFloat)X;
 */

/**  Y  */
@property (nonatomic, assign) CGFloat Y;

/** 在分类中声明@property，只会生成方法的声明，不会生成方法的实现和带有_下划线的成员变量 */

@end
