//
//  UIImageView+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^LJLodeedImageCallback)(NSError *error, UIImage *image);
@interface UIImageView (LJKit)

/**
 根据地址加载图片,不使用占位图

 @param urlStr 地址
 */
- (void)lj_loadImageWithUrlStr:(NSString *)urlStr;

/**
 根据地址加载图片,使用默认占位图

 @param urlStr 地址
 */
- (void)lj_loadImageDefaultPlaceholderImageWithUrlStr:(NSString *)urlStr;


/**
 根据地址加载图片,使用指定占位图

 @param urlStr 地址
 @param placeholderImage 指定占位图
 */
- (void)lj_loadImageWithUrlStr:(NSString *)urlStr andPlaceholderImage:(UIImage *)placeholderImage;

/**
 根据地址加载图片,使用指定占位图

 @param urlStr 地址
 @param placeholderImage 指定占位图
 @param callback 下载完成后的回调
 */
- (void)lj_loadImageWithUrlStr:(NSString *)urlStr andPlaceholderImage:(UIImage *)placeholderImage andCallback:(LJLodeedImageCallback)callback;
@end

NS_ASSUME_NONNULL_END
