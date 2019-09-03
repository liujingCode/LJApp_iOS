//
//  LJDesktopClockControlView.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LJDesktopClockControlViewAction) {
    LJDesktopClockControlViewActionTap,
};
@interface LJDesktopClockControlView : UIView
/** 点击返回 */
@property (nonatomic, copy) void (^backActionCallabck) (void);

/** 是否正在展示设置页面 */
@property (nonatomic, assign,getter=isSettingsShow) BOOL settingsShow;
/** 事件回调 */
@property (nonatomic, copy) void (^viewAction) (LJDesktopClockControlViewAction action);
@end

NS_ASSUME_NONNULL_END
