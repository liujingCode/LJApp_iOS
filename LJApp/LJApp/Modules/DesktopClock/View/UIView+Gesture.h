//
//  UIView+Gesture.h
//  LJApp
//
//  Created by developer on 2019/9/2.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gesture)
/** 是否正在编辑 */
@property (nonatomic, assign, getter=isLj_editing) BOOL lj_editing;
/** 是否允许拖拽 */
@property (nonatomic, assign, getter=isLj_dragEnable) BOOL lj_dragEnable;
@end

NS_ASSUME_NONNULL_END
