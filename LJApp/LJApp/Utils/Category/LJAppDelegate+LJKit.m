//
//  LJAppDelegate+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJAppDelegate+LJKit.h"
#import "LJMainTabBarController.h"

#import <UMCommon/UMCommon.h>
#import <UMShare/UMShare.h>

@implementation LJAppDelegate (LJKit)
/**
 设置根控制器
 */
- (void)setupRootController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LJMainTabBarController *tabBarVC = [LJMainTabBarController new];
    self.window.rootViewController =tabBarVC;
    [self.window makeKeyAndVisible];
}


/**
 设置第三方SDK授权
 */
- (void)setupThirdSDKAuth {
    // 友盟基础key
    [UMConfigure initWithAppkey:@"d63a6760cafb2b766000cf1" channel:nil];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105631904" appSecret:@"1BsLatgYh35djIMx" redirectURL:nil];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wxd4083c9bb3753a20" appSecret:@"ae281d8426cba9fdc3bb110f8cc8aead" redirectURL:nil];
}


/**
 设置第三方库全局配置
 */
- (void)setupThirdLibGlobalConfig {
    
}

/**
 设置启动配置
 */
- (void)setupLaunchConfig {
    
}
@end
