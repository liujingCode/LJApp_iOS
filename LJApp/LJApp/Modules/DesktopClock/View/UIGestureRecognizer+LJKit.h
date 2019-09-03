//
//  UIGestureRecognizer+LJKit.h
//  LJApp
//
//  Created by developer on 2019/9/2.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LJKit_UIGestureRecognizerDirection) {
    LJKit_UIGestureRecognizerDirectionUnknown,
    LJKit_UIGestureRecognizerDirectionTop,
    LJKit_UIGestureRecognizerDirectionBottom,
    LJKit_UIGestureRecognizerDirectionLeft,
    LJKit_UIGestureRecognizerDirectionRight,
};


@interface UIGestureRecognizer (LJKit)

/**
 判断pan手势滑动方向

 @return 滑动方向
 */
- (LJKit_UIGestureRecognizerDirection)lj_gestureDirection;
@end

NS_ASSUME_NONNULL_END
