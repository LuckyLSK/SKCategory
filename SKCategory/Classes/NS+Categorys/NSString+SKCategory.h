//
//  NSString+SKCategory.h
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SKCategory)

//区号 0086转+86 负责显示并加*
+(NSString*)stringFormatAndXingAreaCode:(NSString*)areaCode;

///区号 0086转+86 负责显示
+(NSString*)stringFormatAreaCode:(NSString*)areaCode;

//utf-8数据转换为utf-8字符串
+ (NSString *)stringFromUTF8Data:(NSData *)data;

//计算中英文混排的字符串长度
+ (int)stringLength:(NSString  *)str;

//手机号码字符过滤
+ (NSString *)mobilePhoneFilter:(NSString *)str;

/**
 * 判断字段是否包含空格
 */
- (BOOL)validateContainsSpace;

- (BOOL)isNULL;

/**
 *  根据生日返回年龄
 */
- (NSString *)ageFromBirthday;

/**
 *  根据身份证返回岁数
 */
- (NSString *)ageFromIDCard;

/**
 *  根据身份证返回生日
 */
- (NSString*)birthdayFromIDCard;

/**
 *  根据身份证返回性别
 */
- (NSString*)sexFromIDCard;


- (NSMutableAttributedString *)stringWithName:(NSString *)name allValue:(id)allVal selValue:(id)selVal selRange:(NSRange)selRan;

/**
 *  将阿拉伯数字转换为中文数字
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum;

/////////////////
- (NSString *)originName;
+ (NSString *)currentName;
- (NSString *)firstStringSeparatedByString:(NSString *)separeted;

@end

NS_ASSUME_NONNULL_END
