//
//  NSDate+SKChinese.h
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (SKChinese)

// 时间戳转时间
+(NSString *)getChineseTimeWithTimestamp:(NSTimeInterval)time;

//将时间字符串2017-01-01 12:12:12 格式转换成微信时间格式
+(NSString *)GetChineseTime:(NSString *)Time;

//获取当前时间
+(NSString *)GetTime;


/**
 根据时间戳返回日期描述字符串
 /// 格式如下
 ///     -   刚刚(一分钟内)
 ///     -   X分钟前(一小时内)
 ///     -   X小时前(当天)
 ///     -   昨天 HH:mm(昨天)
 ///     -   MM-dd HH:mm(一年内)
 ///     -   yyyy-MM-dd HH:mm(更早期)
 @param interval 时间戳
 @return 字符串
 */
+(NSString *)timeValue:(NSTimeInterval)interval;

/**
 根据时间戳返回日期描述字符串
 /// 格式如下
 ///     -   刚刚(一分钟内)
 ///     -   X分钟前(一小时内)
 ///     -   X小时前(当天)
 ///     -   昨天 HH:mm(昨天)
 ///     -   MM-dd HH:mm(一年内)
 ///     -   yyyy-MM-dd HH:mm(更早期)
 @param string 时间
 @return 字符串
 */
+(NSString*)stringToNSDate:(NSString*)string;


@end

NS_ASSUME_NONNULL_END
