//
//  LJAppDelegate.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJAppDelegate.h"

@implementation LJAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置根控制器
    [self setupRootController];
    // 设置第三方授权
    [self setupThirdSDKAuth];
    // 设置第三方库全局配置
    [self setupThirdLibGlobalConfig];
    // 设置启动配置
    [self setupLaunchConfig];
    return YES;
}
@end
