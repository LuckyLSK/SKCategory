//
//  UILabel+SKAutoHeight.h
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (SKAutoHeight)

- (float)autoHeight;

- (float)autoHeightWithLineSpace:(float)space;

- (void)autoHeight:(int)maxLines;

- (void)autoWidth;

//顶端对齐
-(void)alignTop;

// 两端对齐
- (void)changeAlignmentRightandLeft;

//设置字体行高,注 使用此方法前需先初始文本内容，文本字体
- (void)lineSpacing:(float)space;

@end

NS_ASSUME_NONNULL_END
