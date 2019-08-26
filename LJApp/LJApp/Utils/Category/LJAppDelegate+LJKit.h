//
//  LJAppDelegate+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJAppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/**
 AppDelegate 服务类,用于AppDelegate解耦
 */
@interface LJAppDelegate (LJKit)

/**
 设置根控制器
 */
- (void)setupRootController;


/**
 设置第三方SDK授权
 */
- (void)setupThirdSDKAuth;


/**
 设置第三方库全局配置
 */
- (void)setupThirdLibGlobalConfig;

/**
 设置启动配置
 */
- (void)setupLaunchConfig;
@end

NS_ASSUME_NONNULL_END
