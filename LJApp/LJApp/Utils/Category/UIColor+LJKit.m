//
//  UIColor+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIColor+LJKit.h"

@implementation UIColor (LJKit)
/**
 根据透明新的透明度的颜色
 
 @param newAlpha 透明度
 @return 改变了透明度之后的颜色
 */
- (instancetype)lj_colorWithNewAlpha:(float)newAlpha {
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 0.0;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:newAlpha];
    return newColor;
}

/**
 生成随机色
 
 @return 随机色
 */
+ (instancetype)lj_randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
}


/**
 根据16进制字符串生成颜色,支持前缀:0x,0X,#
 
 @param hexString 16进制字符串
 @return 颜色
 */
+ (instancetype)lj_colorWithHexString:(NSString *)hexString {
    if (hexString.length < 6) {
        return [UIColor clearColor];
    }
    // 默认透明度
    NSString *aStr = @"FF";
    NSMutableString *mstr = [NSMutableString stringWithString:hexString];
    [mstr insertString:aStr atIndex:hexString.length - 6];
    return [self lj_colorWithArgbHexString:[NSString stringWithString:mstr]];
}

/**
 根据16进制字符串生成颜色,支持前缀:0x,0X,#
 
 @param hexString 16进制字符串,写法:#FFababab,FF为透明度
 @return 颜色
 */
+ (instancetype)lj_colorWithArgbHexString:(NSString *)hexString {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 8) {
        return [UIColor clearColor];
    }
    
    // 判断前缀,格式化string
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
       cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 8) {
       return [UIColor clearColor];
    }
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    // A、R、G、B
    NSString *aString = [cString substringWithRange:range];
    range.location = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 4;
    NSString *gString = [cString substringWithRange:range];
    range.location = 6;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int a, r, g, b;
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:((float) a / 255.0f)];
}


/**
 根据rgb生成颜色
 
 @param red r
 @param green g
 @param blue b
 @return 颜色
 */
+ (instancetype)lj_colorWithRed:(float)red andGreen:(float)green andBlue:(float)blue {
    return [self lj_colorWithRed:red andGreen:green andBlue:blue andAlpha:1.0];
}

/**
 根据rgb生成颜色
 
 @param red r
 @param green g
 @param blue b
 @param alpha 透明度
 @return 颜色
 */
+ (instancetype)lj_colorWithRed:(float)red andGreen:(float)green andBlue:(float)blue andAlpha:(float)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
@end
