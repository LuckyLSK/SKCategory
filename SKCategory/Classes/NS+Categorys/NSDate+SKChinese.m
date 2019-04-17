//
//  NSDate+SKChinese.m
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import "NSDate+SKChinese.h"

@implementation NSDate (SKChinese)

+(NSString *)getChineseTimeWithTimestamp:(NSTimeInterval)time{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:confromTimesp];
    return [self GetChineseTime:dateString];
}

+(NSString *)GetChineseTime:(NSString *)Timer{
    
    //返回的字符串
    NSString *ChineseStr;
    //获取当前时间
    NSString *CurrentTimer = [self GetTime];
    //当前时间数组
    NSArray *CurrentTimeArr = [CurrentTimer componentsSeparatedByString:@" "];
    //当前年月日
    NSString *CurrentTimeFirstStr = CurrentTimeArr.firstObject;
    //当前时分秒
    NSString *CurrentTimeLastStr = CurrentTimeArr.lastObject;
    //拆分当前年月日
    NSArray *CurrentTimeFirstArr = [CurrentTimeFirstStr componentsSeparatedByString:@"-"];
    //拆分当前时分秒
    NSArray *CurrentTimeLastArr = [CurrentTimeLastStr componentsSeparatedByString:@":"];
    //当前年
    NSString *CurrentYear = CurrentTimeFirstArr.firstObject;
    //当前月
    NSString *CurrentMonth = CurrentTimeFirstArr[1];
    //当前日
    NSString *CurrentDay = CurrentTimeFirstArr.lastObject;
    //当前时
    NSString *CurrentTime = CurrentTimeLastArr.firstObject;
    //当前分
    NSString *CurrentBranch = CurrentTimeLastArr[1];
    //当前秒
    NSString *CurrentSecond = CurrentTimeLastArr.lastObject;
    //时间数组
    NSArray *TimeArr = [Timer componentsSeparatedByString:@" "];
    //年月日
    NSString *TimeFirstStr = TimeArr.firstObject;
    //时分秒
    NSString *TimeLastStr = TimeArr.lastObject;
    //拆分年月日
    NSArray *TimeFirstArr = [TimeFirstStr componentsSeparatedByString:@"-"];
    //拆分时分秒
    NSArray *TimeLastArr = [TimeLastStr componentsSeparatedByString:@":"];
    //年
    NSString *Year = TimeFirstArr.firstObject;
    //月
    NSString *Month = TimeFirstArr[1];
    //日
    NSString *Day = TimeFirstArr.lastObject;
    //时
    NSString *Time = TimeLastArr.firstObject;
    //分
    NSString *Branch = TimeLastArr[1];
    //秒
    NSString *Second = TimeLastArr.lastObject;
    
    if ([CurrentYear integerValue] < [Year integerValue]) {
        return @"时间错误";
    }else if ([CurrentYear integerValue] > [Year integerValue]){
        return [NSString stringWithFormat:@"%ld年前",[CurrentYear integerValue] - [Year integerValue]];
    }else{
        if ([CurrentMonth integerValue] < [Month integerValue]) {
            return @"时间错误";
        }else if ([CurrentMonth integerValue] > [Month integerValue]){
            return [NSString stringWithFormat:@"%ld个月前",[CurrentMonth integerValue] - [Month integerValue]];
        }else{
            if ([CurrentDay integerValue] < [Day integerValue]) {
                return @"时间错误";
            }else if ([CurrentDay integerValue] > [Day integerValue]){
                if ([CurrentDay integerValue] - [Day integerValue] >= 7) {
                    return [NSString stringWithFormat:@"一周前"];
                }
                return [NSString stringWithFormat:@"%ld天前",[CurrentDay integerValue] - [Day integerValue]];
            }else{
                if ([CurrentTime integerValue] < [Time integerValue]) {
                    return @"时间错误";
                }else if ([CurrentTime integerValue] > [Time integerValue]){
                    return [NSString stringWithFormat:@"%ld小时前",[CurrentTime integerValue] - [Time integerValue]];
                }else{
                    if ([CurrentBranch integerValue] < [Branch integerValue]) {
                        return @"时间错误";
                    }else if ([CurrentBranch integerValue] > [Branch integerValue]){
                        return [NSString stringWithFormat:@"%ld分钟前",[CurrentBranch integerValue] - [Branch integerValue]];
                    }else{
                        if ([CurrentSecond integerValue] < [Second integerValue]) {
                            return @"时间错误";
                        }else{
                            return @"刚刚";
                        }
                    }
                }
            }
        }
    }
    
    return ChineseStr;
}

//获取当前时间
+(NSString *)GetTime{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

+ (NSString*)weekDayStr:(NSString *)format{
    
    
    NSString *weekDayStr = nil;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    if (format.length >= 10) {
        NSArray *array = [[format substringToIndex:10] componentsSeparatedByString:@"-"];
        NSInteger year = [[array objectAtIndex:0] integerValue];
        NSInteger month = [[array objectAtIndex:1] integerValue];
        NSInteger day = [[array objectAtIndex:2] integerValue];
        [comps setYear:year];
        [comps setMonth:month];
        [comps setDay:day];
    }
    
    /*
     NSString *str = format;
     if (str.length >= 10) {
     NSString *nowString = [str substringToIndex:10];
     NSArray *array = [nowString componentsSeparatedByString:@"-"];
     if (array.count == 0) {
     array = [nowString componentsSeparatedByString:@"/"];
     }
     if (array.count >= 3) {
     NSInteger year = [[array objectAtIndex:0] integerValue];
     NSInteger month = [[array objectAtIndex:1] integerValue];
     NSInteger day = [[array objectAtIndex:2] integerValue];
     [comps setYear:year];
     [comps setMonth:month];
     [comps setDay:day];
     }
     }
     */
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateFromComponents:comps];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    NSInteger week = [weekdayComponents weekday];
    week ++;
    switch (week) {
        case 1:
            weekDayStr = @"星期日";
            break;
        case 2:
            weekDayStr = @"星期一";
            break;
        case 3:
            weekDayStr = @"星期二";
            break;
        case 4:
            weekDayStr = @"星期三";
            break;
        case 5:
            weekDayStr = @"星期四";
            break;
        case 6:
            weekDayStr = @"星期五";
            break;
        case 7:
            weekDayStr = @"星期六";
            break;
        default:
            weekDayStr = @"";
            break;
    }
    return weekDayStr;
    
}


//时间显示
+ (NSString *)timeValue:(NSTimeInterval)interval
{
    NSTimeInterval _interval = [[NSDate date] timeIntervalSince1970];
    _interval-=interval;
    NSString *result = @"";
    int temp = 0;
    if(_interval <60) { //60秒以内
        result = @"刚刚";
    }
    else if((temp = _interval/60) <60) { //1小时以内
        result = [NSString stringWithFormat:@"%d分钟前", temp];
    }
    else if((temp = temp/60) <24 ) { //超过60分钟今天内的
        result = [NSString stringWithFormat:@"%d小时前", temp];
    }
    else if((temp = temp/24) <1){ //今天
        result = [NSString stringWithFormat:@"今天"];
    }
    else if((temp ) <2){ //昨天
        result = [NSString stringWithFormat:@"昨天"];
    }
    else if((temp) <30){ //一个月内的
        result = [NSString stringWithFormat:@"%d天前", temp];
    }
    else if((temp = temp/30) <12){ //等于或超过1个月（规定一个月为30天
        result = [NSString stringWithFormat:@"%d月前", temp];
    }
    else{ //比1年更久的时间
        
        temp = temp/12;
        result = [NSString stringWithFormat:@"%d年前", temp];
        
        //        result = [NSString stringByStringFormat:@"yyyy-MM-dd HH:mm:ss" data:[NSDate dateWithTimeIntervalSince1970:interval] ];
        
    }
    
    return result;
}


+(NSString*)stringToNSDate:(NSString*)string{
    NSString* timeStr = string;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSDate* date = [formatter dateFromString:timeStr];
    NSString *result = @"";
    result = [NSDate timeValue:[date timeIntervalSince1970]];
    return result;
}

@end
