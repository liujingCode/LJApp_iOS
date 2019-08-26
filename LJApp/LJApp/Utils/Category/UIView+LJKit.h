//
//  UIView+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LJKit)

/** 坐标X */
@property (nonatomic, assign) CGFloat lj_x;
/** 坐标Y */
@property (nonatomic, assign) CGFloat lj_y;
/** 尺寸width */
@property (nonatomic, assign) CGFloat lj_width;
/** 尺寸height */
@property (nonatomic, assign) CGFloat lj_height;
/** 尺寸 */
@property (nonatomic, assign) CGSize lj_size;
/** 坐标 */
@property(assign, nonatomic) CGPoint lj_origin;
/** 中心点X */
@property(assign, nonatomic) CGFloat lj_centerX;
/** 中心点Y */
@property(assign, nonatomic) CGFloat lj_centerY;


/** 位置left */
@property (nonatomic, assign) CGFloat lj_left;
/** 位置right */
@property (nonatomic, assign) CGFloat lj_right;
/** 位置top */
@property (nonatomic, assign) CGFloat lj_top;
/** 位置bottom */
@property (nonatomic, assign) CGFloat lj_bottom;


/** 圆角半径 */
@property(assign, nonatomic) IBInspectable CGFloat lj_cornerRadius;
/** 边框颜色 */
@property(copy, nonatomic) IBInspectable UIColor *lj_borderColor;
/** 边框宽度 */
@property(assign, nonatomic) IBInspectable CGFloat lj_borderWidth;
/** 阴影透明度 */
@property (assign, nonatomic) IBInspectable CGFloat lj_shadowOpacity;
/** 阴影偏移量 */
@property (assign, nonatomic) IBInspectable CGSize lj_shadowOffset;
/** 阴影半径 */
@property (assign, nonatomic) IBInspectable CGFloat lj_shadowRadius;


/**
 获取截图

 @return 该view的截图
 */
- (UIImage *)lj_getSnapShotImage;

@end

NS_ASSUME_NONNULL_END
