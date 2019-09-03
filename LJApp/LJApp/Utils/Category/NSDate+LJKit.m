//
//  NSDate+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "NSDate+LJKit.h"

@implementation NSDate (LJKit)
/**
 根据date字符串和默认格式获取date; @"yyyy-MM-dd HH:mm:ss"
 
 @param dateStr date字符串
 @return date
 */
+ (instancetype)lj_dateWithDateStr:(NSString *)dateStr {
    NSString *defaultFormatStr = @"yyyy-MM-dd HH:mm:ss";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:defaultFormatStr];
    return [dateFormatter dateFromString:dateStr];
}

/**
 根据date字符串和指定格式获取date
 
 @param dateStr date字符串
 @param formatStr 格式
 @return date
 */
+ (instancetype)lj_dateWithDateStr:(NSString *)dateStr andFormatStr:(NSString *)formatStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatStr];
    return [dateFormatter dateFromString:dateStr];
}

/**
 根据date和默认格式获取字符串;@"yyyy-MM-dd HH:mm:ss"
 
 @param date date
 @return 字符串
 */
+ (NSString *)lj_stringWithDate:(NSDate *)date {
    NSString *defaultFormatStr = @"yyyy-MM-dd HH:mm:ss";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:defaultFormatStr];
    return [dateFormatter stringFromDate:date];
}

/**
 根据date和指定格式获取字符串
 
 @param date date
 @param formatStr 指定格式
 @return 字符串
 */
+ (NSString *)lj_stringWithDate:(NSDate *)date andFormatStr:(NSString *)formatStr {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatStr];
    return [dateFormatter stringFromDate:date];
}


#pragma mark - 比较时间
/** 是否是今天 */
- (BOOL)lj_isToday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    BOOL isToday = NO;
    if ((selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day)) {
        isToday = YES;
    }
    return isToday;
}

/** 是否是昨天 */
- (BOOL)lj_isYesterday {
    // 统一格式YMD
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    
    NSString *selfStr = [format stringFromDate:self];
    NSDate *selfFormatDate = [format dateFromString:selfStr];
    
    NSString *nowStr = [format stringFromDate:[NSDate date]];
    NSDate *nowFormatDate = [format dateFromString:nowStr];
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfFormatDate toDate:nowFormatDate options:0];
    return cmps.day == 1;
}

/** 是否是今年 */
- (BOOL)lj_isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    NSDateComponents *nowCmps = [calendar  components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return nowCmps.year == selfCmps.year;
}

+ (NSString*)lj_weekdayStrWithDate:(NSDate *)date {
    NSCalendarUnit components = (NSCalendarUnit)(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitHour | NSCalendarUnitMinute);
    
    NSDateComponents *weekday = [[NSCalendar currentCalendar] components:components fromDate:date];
    static NSDictionary *daysOfWeekDict = nil;
    daysOfWeekDict = @{@(1):@"星期日",
                       @(2):@"星期一",
                       @(3):@"星期二",
                       @(4):@"星期三",
                       @(5):@"星期四",
                       @(6):@"星期五",
                       @(7):@"星期六",};
    return [daysOfWeekDict objectForKey:@(weekday.weekday)];
}
@end
