//
//  UIImage+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIImage+LJKit.h"

@implementation UIImage (LJKit)

/**
 根据字符串生成二维码
 
 @param string 内容字符串
 @param imageWidth 二维码图片的width
 @return 宽高为width的二维码图片
 */
+ (UIImage *)lj_qrcodeImageWithString:(NSString *)string andSize:(CGFloat)imageWidth {
    // 创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 过滤器恢复默认设置
    [filter setDefaults];
    // 给过滤器添加数据,通过KVC设置过滤器,只能设置NSData类型
    NSString *dataString = string;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    // 获取输出的二维码
    CIImage *outputImage = [filter outputImage];
    // 显示二维码
    UIImage *formatImage = [self lj_createNonInterpolatedUIImageWithCIImage:outputImage andSize:imageWidth];
    return formatImage;
}

/**
 *  根据CIImage生成指定大小的UIImage
 *
 *  @param image CIImage
 *  @param size  图片宽度
 */
+ (UIImage *)lj_createNonInterpolatedUIImageWithCIImage:(CIImage *)image andSize:(CGFloat) size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

/**
 根据颜色创建一张1*1的图片
 
 @param color 图片颜色
 @return 大小为1*1的图片
 */
+ (instancetype)lj_imageWithColor:(UIColor *)color {
    return [self lj_imageWithSize:CGSizeMake(1.0, 1.0) andColor:color];
}

/**
 根据颜色创建一张图片
 
 @param size 图片尺寸
 @param color 图片颜色
 @return 大小为指定尺寸的图片
 */
+ (instancetype)lj_imageWithSize:(CGSize)size andColor:(UIColor *)color {
    CGSize targetSize = CGSizeMake(size.width * [UIScreen mainScreen].scale, size.height * [UIScreen mainScreen].scale);
    UIGraphicsBeginImageContext(targetSize);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, targetSize.width, targetSize.height));
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 圆角图片
 
 @param radius 圆角值
 @return 剪裁好的图片
 */
- (instancetype)lj_imageWithCornerRadius:(CGFloat)radius {
    CGRect rect = (CGRect){0.f,0.f,self.size};
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [path addClip];
    [self drawInRect:rect];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


/**
 获取毛玻璃视图
 
 @return 毛玻璃视图
 */
- (instancetype)lj_blurryImage {
    return nil;
}
@end
