//
//  UIView+SKRectCorner.h
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SKRectCorner)

/**
 *  圆角半径 默认 5
 */
@property(nonatomic,assign)CGFloat rectCornerRadii;

/**
 *  圆角方位
 */
@property(nonatomic,assign)UIRectCorner rectCorner;

@end

NS_ASSUME_NONNULL_END
