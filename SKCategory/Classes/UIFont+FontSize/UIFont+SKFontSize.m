//
//  UIFont+SKFontSize.m
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import "UIFont+SKFontSize.h"
#import <objc/runtime.h>

#define ScrenScale  ([UIScreen mainScreen].bounds.size.width/375.0)

@implementation UIFont (SKFontSize)

+ (CGFloat)getScrenScale{
    return ScrenScale;
    //    if ([UIScreen mainScreen].bounds.size.width > 375) {
    //        return 2;
    //    }else if ([UIScreen mainScreen].bounds.size.width == 375){
    //        return 0;
    //    }else{
    //        return -1;
    //    }
}

+(void)exchangeClassSelector:(SEL)aSel toSelector:(SEL)bSel
{
    Method aMethod = class_getClassMethod(self, aSel);
    Method bMethod = class_getClassMethod(self, bSel);
    method_exchangeImplementations(aMethod, bMethod);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeClassSelector:@selector(systemFontOfSize:) toSelector:@selector(mySystemFontOfSize:)];
        [self exchangeClassSelector:@selector(boldSystemFontOfSize:) toSelector:@selector(myBoldSystemFontOfSize:)];
        [self exchangeClassSelector:@selector(fontWithName:size:) toSelector:@selector(myFontWithName:size:)];
    });
}

+ (UIFont *)mySystemFontOfSize:(CGFloat)fontSize{
    //        return [self mySystemFontOfSize:fontSize + [self getScrenScale]];
    return [self mySystemFontOfSize:fontSize  * [self getScrenScale]];
}

/**
 * xib 设置粗字体 必须使用设置 xib设置不起作用
 */
+ (UIFont *)myBoldSystemFontOfSize:(CGFloat)fontSize{
    return [self myBoldSystemFontOfSize:fontSize  * [self getScrenScale]];
}

+ (UIFont *)myFontWithName:(NSString *)fontName size:(CGFloat)fontSize{
    return [self myFontWithName:fontName size:fontSize  * [self getScrenScale]];
}

@end
