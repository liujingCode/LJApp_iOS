//
//  UIImage+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LJKit)

/**
 根据字符串生成二维码
 
 @param string 内容字符串
 @param imageWidth 二维码图片的width
 @return 宽高为width的二维码图片
 */
+ (UIImage *)lj_qrcodeImageWithString:(NSString *)string andSize:(CGFloat)imageWidth;

/**
 根据颜色创建一张1*1的图片
 
 @param color 图片颜色
 @return 大小为1*1的图片
 */
+ (instancetype)lj_imageWithColor:(UIColor *)color;

/**
 根据颜色创建一张图片
 
 @param size 图片尺寸
 @param color 图片颜色
 @return 大小为指定尺寸的图片
 */
+ (instancetype)lj_imageWithSize:(CGSize)size andColor:(UIColor *)color;

/**
 圆角图片
 
 @param radius 圆角值
 @return 剪裁好的图片
 */
- (instancetype)lj_imageWithCornerRadius:(CGFloat)radius;


/**
 获取毛玻璃视图
 
 @return 毛玻璃视图
 */
- (instancetype)lj_blurryImage;

@end

NS_ASSUME_NONNULL_END
