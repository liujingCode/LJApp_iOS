//
//  LJAppDelegate.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
/** 是否允许屏幕旋转 */
@property (nonatomic, assign) BOOL allowRotation;
@end

NS_ASSUME_NONNULL_END
