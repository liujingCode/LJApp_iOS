//
//  NSString+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LJKit)


#pragma mark - 字符串校验
/** 手机号校验 */
+ (BOOL)lj_checkPhoneNumberWithText:(NSString *)text;

/** 短信验证码校验 */
+ (BOOL)lj_checkSmsCodeWithText:(NSString *)text;

/** 登录密码校验 */
+ (BOOL)lj_checkLoginPwdWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
