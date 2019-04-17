//
//  NSString+SKCategory.m
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import "NSString+SKCategory.h"

@implementation NSString (SKCategory)

///区号 0086转+86 负责显示并加*
+(NSString*)stringFormatAndXingAreaCode:(NSString*)areaCode{
    if (!areaCode || areaCode.length < 3) return areaCode;
    NSInteger xingLeng = (areaCode.length - 3)/2;
    NSString *xingStr = @"";
    for (int i = 0; i < xingLeng; i++) {
        xingStr = [xingStr stringByAppendingString:@"*"];
    }
    areaCode = [areaCode stringByReplacingCharactersInRange:NSMakeRange(areaCode.length - xingLeng - xingLeng/2, xingLeng) withString:xingStr];
    NSString *code = [areaCode substringWithRange:NSMakeRange(0, 2)];
    return [@"+"stringByAppendingString:[[areaCode componentsSeparatedByString:code] lastObject]];
}

///区号 0086转+86 负责显示
+(NSString*)stringFormatAreaCode:(NSString*)areaCode;{
    if (!areaCode || areaCode.length < 3) return areaCode;
    NSString *code = [areaCode substringWithRange:NSMakeRange(0, 2)];
    return [@"+"stringByAppendingString:[[areaCode componentsSeparatedByString:code] lastObject]];
}

//utf-8数据转换为utf-8字符串
+ (NSString *)stringFromUTF8Data:(NSData *)data{
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    str = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return str;
}

//格式化输出各种对象
+ (NSString *)stringFormatValue:(id)obj{
    NSString *str = @"";
    if(obj == nil || [obj isKindOfClass:[NSNull class]]) {
    }
    else if([obj isKindOfClass:[NSNumber class]]) {
        str = [(NSNumber *)obj stringValue];
    }
    else if([obj isKindOfClass:[NSString class]] && [(NSString *)obj length] && ![obj isEqualToString:@"null"]) {
        str = obj;
    }
    return str;
}

//判断字符串长度, 支持中英文 特殊字符混编
+ (int)stringLength:(NSString  *)str
{
    int len = 0;
    char* p = (char*) [str cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i = 0 ; i < [str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++)
    {
        if (*p) {
            p++;
            len++;
        }
        else {
            p++;
        }
    }
    return len;
}

//手机号码字符过滤
+ (NSString *)mobilePhoneFilter:(NSString *)str
{
    if(str == nil || [str length] == 0)
        return nil;
    NSMutableString *phone = [NSMutableString stringWithCapacity:0];
    for(int i = 0; i < [str length]; i++)
    {
        char ch = [str characterAtIndex:i];
        if((ch >= '0' && ch <= '9') || ch == '-') {
            [phone appendFormat:@"%c", ch];
        }
    }
    return phone;
}

- (BOOL)validateContainsSpace {
    return [self rangeOfString:@" "].location == NSNotFound;
}

- (BOOL)isNULL{
    if (self == nil) {
        return YES;
    }
    if (self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (NSString *)ageFromBirthday {
    if (self.length != 10 ||
        [self characterAtIndex:4] != '.' ||
        [self characterAtIndex:7] != '.') {
        return @"";
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    NSString *today = [formatter stringFromDate:[NSDate date]];
    
    NSString *selfYear = [self substringToIndex:4];
    NSString *nowYear = [today substringToIndex:4];
    NSInteger age = nowYear.integerValue - selfYear.integerValue;
    
    NSString *selfDate = [self substringFromIndex:5];
    NSString *nowDate = [today substringFromIndex:5];
    if ([nowDate compare:selfDate] < 0) {
        age = age - 1;
    }
    
    if (age < 0) {
        return @"";
    }
    
    return [NSString stringWithFormat:@"%zd", age];
}

- (NSString *)ageFromIDCard {
    NSString *birthday = [self birthdayFromIDCard];
    return [birthday ageFromBirthday];
}

- (NSString*)birthdayFromIDCard {
    NSString *result = @"未知";
    if (self.length == 15) {
        NSMutableString *birthString = [[self substringWithRange:NSMakeRange(6, 6)] mutableCopy];
        [birthString insertString:@"19" atIndex:0];
        [birthString insertString:@"." atIndex:4];
        [birthString insertString:@"." atIndex:7];
        result = birthString;
    } else if (self.length == 18) {
        NSMutableString *birthString = [[self substringWithRange:NSMakeRange(6, 8)] mutableCopy];
        [birthString insertString:@"." atIndex:4];
        [birthString insertString:@"." atIndex:7];
        result = birthString;
    }
    
    return result;
}

- (NSString*)sexFromIDCard {
    NSString *sexString = @"";
    
    if (self.length == 15) {
        sexString =  [[self substringWithRange:NSMakeRange(14, 1)] mutableCopy];
    } else if (self.length == 18) {
        sexString = [[self substringWithRange:NSMakeRange(16, 1)] mutableCopy];
    }
    
    int x = sexString.intValue;
    if (x < 0 || sexString.length == 0) {
        return @"";
    }
    if (x % 2 == 0) {
        return @"女";
    } else {
        return @"男";
    }
    return sexString;
}

- (NSMutableAttributedString *)stringWithName:(NSString *)name allValue:(id)allVal selValue:(id)selVal selRange:(NSRange)selRan{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attStr addAttribute:name value:allVal range:NSMakeRange(0, attStr.length)];
    [attStr addAttribute:name value:selVal range:selRan];
    return attStr;
}

/**
 *  将阿拉伯数字转换为中文数字
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum
{
    NSString *arabicNumStr = [NSString stringWithFormat:@"%ld",(long)arabicNum];
    NSArray *arabicNumeralsArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chineseNumeralsArray = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chineseNumeralsArray forKeys:arabicNumeralsArray];
    
    if (arabicNum < 20 && arabicNum > 9) {
        if (arabicNum == 10) {
            return @"十";
        }else{
            NSString *subStr1 = [arabicNumStr substringWithRange:NSMakeRange(1, 1)];
            NSString *a1 = [dictionary objectForKey:subStr1];
            NSString *chinese1 = [NSString stringWithFormat:@"十%@",a1];
            return chinese1;
        }
    }else{
        NSMutableArray *sums = [NSMutableArray array];
        for (int i = 0; i < arabicNumStr.length; i ++)
        {
            NSString *substr = [arabicNumStr substringWithRange:NSMakeRange(i, 1)];
            NSString *a = [dictionary objectForKey:substr];
            NSString *b = digits[arabicNumStr.length -i-1];
            NSString *sum = [a stringByAppendingString:b];
            if ([a isEqualToString:chineseNumeralsArray[9]])
            {
                if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
                {
                    sum = b;
                    if ([[sums lastObject] isEqualToString:chineseNumeralsArray[9]])
                    {
                        [sums removeLastObject];
                    }
                }else
                {
                    sum = chineseNumeralsArray[9];
                }
                
                if ([[sums lastObject] isEqualToString:sum])
                {
                    continue;
                }
            }
            [sums addObject:sum];
        }
        NSString *sumStr = [sums  componentsJoinedByString:@""];
        NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
        return chinese;
    }
}

@end
