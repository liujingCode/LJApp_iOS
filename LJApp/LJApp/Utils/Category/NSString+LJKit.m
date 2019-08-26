//
//  NSString+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "NSString+LJKit.h"

@implementation NSString (LJKit)
#pragma mark - 字符串校验
/** 手机号校验 */
+ (BOOL)lj_checkPhoneNumberWithText:(NSString *)text {
    NSString *regular = @"^[0-9]{11}$";
    return [self lj_checkTextWithRegular:regular andText:text];
}
/** 短信验证码校验 */
+ (BOOL)lj_checkSmsCodeWithText:(NSString *)text {
    // 校验6位数纯数字短信验证码
    NSString *regular = @"^[0-9]{6}$";
    return [self lj_checkTextWithRegular:regular andText:text];
}

/** 登录密码校验 */
+ (BOOL)lj_checkLoginPwdWithText:(NSString *)text {
    //  ios键盘全部特殊字符([]{}#%^*+=_\|~<>￥·.,?!'-/:;()$&@")
    // 8-12位 必须包含数字字母和特殊字符()
    // warning "\\"前一个\为忽略转义符  "\\[" 第一个\为忽略转义符,第二个\为转义符
    NSString *regular = @"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[\\[\\]{}#%^*+=_\\|~<>￥·.,?!'-/:;()$&@\"]).{8,12}$";
    return [self lj_checkTextWithRegular:regular andText:text];
}

// 正则匹配
+ (BOOL)lj_checkTextWithRegular:(NSString *)regular andText:(NSString *)text{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    if ([pred evaluateWithObject:text]) {
        return YES;
    }
    return NO;
}
@end
