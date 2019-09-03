//
//  LJDesktopClockContentView.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LJDesktopClockContentViewAction) {
    LJDesktopClockContentViewActionTap,
};
@interface LJDesktopClockContentView : UIView
/** 隐藏底部日期 */
@property (nonatomic, assign) BOOL hiddenDate;
/** 定时器 */
@property (nonatomic, strong) CADisplayLink * _Nullable displayLink;
/** 事件回调 */
@property (nonatomic, copy) void (^viewAction) (LJDesktopClockContentViewAction action);
@end

NS_ASSUME_NONNULL_END
