//
//  NSDictionary+SKCategory.h
//  SKCategory_Example
//
//  Created by 李烁凯 on 2019/4/17.
//  Copyright © 2019 luckyLSK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SKCategory)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonStr;

- (NSString*)jsonString;

//安全的获取 Dictionary值 避免网络数据键值为null 造成的crash
- (id)safeObjectForKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
