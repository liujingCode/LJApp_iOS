//
//  UIView+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIView+LJKit.h"

@implementation UIView (LJKit)
- (void)setLj_x:(CGFloat)lj_x {
    CGRect frame = self.frame;
    frame = CGRectMake(lj_x, frame.origin.y, frame.size.width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_x {
    return self.frame.origin.x;
}

- (void)setLj_y:(CGFloat)lj_y {
    CGRect frame = self.frame;
    frame = CGRectMake(frame.origin.x, lj_y, frame.size.width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_y {
    return self.frame.origin.y;
}

- (void)setLj_width:(CGFloat)lj_width {
    CGRect frame = self.frame;
    frame = CGRectMake(frame.origin.x, frame.origin.y, lj_width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_width {
    return self.frame.size.width;
}

- (void)setLj_height:(CGFloat)lj_height {
    CGRect frame = self.frame;
    frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, lj_height);
    self.frame = frame;
}
- (CGFloat)lj_height {
    return self.frame.size.height;
}

- (void)setLj_origin:(CGPoint)lj_origin {
    CGRect frame = self.frame;
    frame.origin = lj_origin;
    self.frame = frame;
}
- (CGPoint)lj_origin {
    return self.frame.origin;
}

- (void)setLj_size:(CGSize)lj_size {
    CGRect frame = self.frame;
    frame.size = lj_size;
    self.frame = frame;
}
- (CGSize)lj_size {
    return self.frame.size;
}

- (void)setLj_centerX:(CGFloat)lj_centerX {
    CGPoint center = self.center;
    center.x = lj_centerX;
    self.center = center;
}
- (CGFloat)lj_centerX {
    return self.center.x;
}

- (void)setLj_centerY:(CGFloat)lj_centerY {
    CGPoint center = self.center;
    center.x = lj_centerY;
    self.center = center;
}
- (CGFloat)lj_centerY {
    return self.center.y;
}

- (void)setLj_left:(CGFloat)lj_left {
    CGRect frame = self.frame;
    frame = CGRectMake(lj_left, frame.origin.y, frame.size.width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_left {
    return self.frame.origin.x;
}

- (void)setLj_right:(CGFloat)lj_right {
    CGRect frame = self.frame;
    CGFloat x = lj_right - frame.size.width;
    frame = CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_right {
    return self.frame.size.width;
}

- (void)setLj_top:(CGFloat)lj_top {
    CGRect frame = self.frame;
    frame = CGRectMake(frame.origin.x, lj_top, frame.size.width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_top {
    return self.frame.origin.y;
}

- (void)setLj_bottom:(CGFloat)lj_bottom {
    CGRect frame = self.frame;
    CGFloat y = lj_bottom - frame.size.height;
    frame = CGRectMake(frame.origin.x, y, frame.size.width, frame.size.height);
    self.frame = frame;
}
- (CGFloat)lj_bottom {
    return self.frame.size.height;
}

#pragma mark - Layer相关
- (void)setLj_cornerRadius:(CGFloat)lj_cornerRadius {
    self.layer.cornerRadius = lj_cornerRadius;
}
- (CGFloat)lj_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setLj_borderColor:(UIColor *)lj_borderColor {
    self.layer.borderColor = lj_borderColor.CGColor;
}
- (UIColor *)lj_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLj_borderWidth:(CGFloat)lj_borderWidth {
    self.layer.borderWidth = lj_borderWidth;
}
- (CGFloat)lj_borderWidth {
    return self.layer.borderWidth;
}

- (void)setLj_shadowOpacity:(CGFloat)lj_shadowOpacity {
    self.layer.shadowOpacity = lj_shadowOpacity;
}
- (CGFloat)lj_shadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setLj_shadowOffset:(CGSize)lj_shadowOffset {
    self.layer.shadowOffset = lj_shadowOffset;
}
- (CGSize)lj_shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setLj_shadowRadius:(CGFloat)lj_shadowRadius {
    self.layer.shadowRadius = lj_shadowRadius;
}
- (CGFloat)lj_shadowRadius {
    return self.layer.shadowRadius;
}




/**
 获取截图
 
 @return 该view的截图
 */
- (UIImage *)lj_getSnapShotImage {
    return nil;
}
@end
