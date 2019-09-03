//
//  NSDate+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LJKit)
#pragma mark - 格式化时间
/**
 根据date字符串和默认格式获取date; @"yyyy-MM-dd HH:mm:ss"
 
 @param dateStr date字符串
 @return date
 */
+ (instancetype)lj_dateWithDateStr:(NSString *)dateStr;

/**
 根据date字符串和指定格式获取date
 
 @param dateStr date字符串
 @param formatStr 格式
 @return date
 */
+ (instancetype)lj_dateWithDateStr:(NSString *)dateStr andFormatStr:(NSString *)formatStr;

/**
 根据date和默认格式获取字符串;@"yyyy-MM-dd HH:mm:ss"
 
 @param date date
 @return 字符串
 */
+ (NSString *)lj_stringWithDate:(NSDate *)date;

/**
 根据date和指定格式获取字符串
 
 @param date date
 @param formatStr 指定格式
 @return 字符串
 */
+ (NSString *)lj_stringWithDate:(NSDate *)date andFormatStr:(NSString *)formatStr;


#pragma mark - 比较时间
/**
 是否是今天
 
 @return YES:是今天;NO:不是今天
 */
- (BOOL)lj_isToday;

/**
 是否是昨天
 
 @return YES:是昨天;NO:不是昨天
 */
- (BOOL)lj_isYesterday;

/**
 是否是今年
 
 @return YES:是今年;NO:不是今年
 */
- (BOOL)lj_isThisYear;


/**
 获取星期信息

 @param date date
 @return 周几
 */
+ (NSString*)lj_weekdayStrWithDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
