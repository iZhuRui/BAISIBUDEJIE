//
//  UIView+BSBDJExtension.m
//  BAISIBUDEJIE
//
//  Created by zhurui on 16/8/30.
//  Copyright © 2016年 zhurui. All rights reserved.
//

#import "UIView+BSBDJExtension.h"

@implementation UIView (BSBDJExtension)

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}

-(void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(CGFloat)X
{
    return self.frame.origin.x;
}

-(CGFloat)Y
{
    return self.frame.origin.y;
}

@end
