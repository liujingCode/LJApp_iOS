//
//  UIColor+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LJKit)

/**
 根据透明新的透明度的颜色

 @param newAlpha 透明度
 @return 改变了透明度之后的颜色
 */
- (instancetype)lj_colorWithNewAlpha:(float)newAlpha;

/**
 生成随机色

 @return 随机色
 */
+ (instancetype)lj_randomColor;


/**
 根据16进制字符串生成透明度为1.0的颜色,支持前缀:0x,0X,#

 @param hexString 16进制字符串
 @return 颜色
 */
+ (instancetype)lj_colorWithHexString:(NSString *)hexString;

/**
 根据16进制字符串生成指定透明度的颜色,支持前缀:0x,0X,#
 
 @param hexString 16进制字符串,写法:#FFababab,FF为透明度
 @return 颜色
 */
+ (instancetype)lj_colorWithArgbHexString:(NSString *)hexString;


/**
 根据rgb生成颜色

 @param red r
 @param green g
 @param blue b
 @return 颜色
 */
+ (instancetype)lj_colorWithRed:(float)red andGreen:(float)green andBlue:(float)blue;

/**
 根据rgb生成颜色
 
 @param red r
 @param green g
 @param blue b
 @param alpha 透明度
 @return 颜色
 */
+ (instancetype)lj_colorWithRed:(float)red andGreen:(float)green andBlue:(float)blue andAlpha:(float)alpha;
@end

NS_ASSUME_NONNULL_END
