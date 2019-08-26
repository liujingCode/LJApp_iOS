//
//  LJAppInfo.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 appInfo
 */
@interface LJAppInfo : NSObject

#pragma mark - 手机信息
+ (NSString *)lj_deviceName;

+ (NSString *)lj_deviceType;

#pragma mark - 系统信息

#pragma mark - app信息
+ (NSString *)lj_appBundleIdentifier;

+ (NSString *)lj_appBuildVersion;

+ (NSString *)lj_appVersion;

+ (NSString *)lj_appDisplayName;

+ (UIImage *)lj_appIcon;

@end

NS_ASSUME_NONNULL_END
