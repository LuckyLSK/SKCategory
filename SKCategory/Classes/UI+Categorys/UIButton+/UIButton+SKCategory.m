//
//  UIButton+SKCategory.m
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import "UIButton+SKCategory.h"

@implementation UIButton (SKCategory)

+ (instancetype)buttonWithNormalTitle:(NSString *)normalTitle normalTitleColor:(UIColor *)normalTitleColor selTitle:(NSString *)selTitle selTitleColor:(UIColor *)selTitleColor target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] init];
    // 设置标题
    [button setTitle:normalTitle forState:UIControlStateNormal];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitle:selTitle forState:UIControlStateSelected];
    [button setTitleColor:selTitleColor forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.adjustsImageWhenHighlighted = NO;
    // 监听方法
    if (action != nil) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

#pragma mark --- 创建默认按钮--有字体、颜色--有图片---有背景
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action backImageName:(NSString *)backImageName  {
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    // 设置标题
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.adjustsImageWhenHighlighted = NO;
    // 图片
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        NSString *highlighted = [NSString stringWithFormat:@"%@_highlighted", imageName];
        [button setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    }
    
    // 背景图片
    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *backHighlighted = [NSString stringWithFormat:@"%@_highlighted", backImageName];
        [button setBackgroundImage:[UIImage imageNamed:backHighlighted] forState:UIControlStateHighlighted];
    }
    
    // 监听方法
    if (action != nil) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

#pragma mark  --- 有文字,有颜色，有字体，有图片，没有背景图片
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:imageName  target:target action:action backImageName:nil];
}

#pragma mark  --- 有文字,有颜色，有字体，没有图片，没有背景
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:nil target:target action:action backImageName:nil];
}

#pragma mark  --- 有文字,有颜色,有字体,没图片，有背景
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action backImageName:(NSString *)backImageName {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:nil target:target action:action backImageName:backImageName];
}

@end
