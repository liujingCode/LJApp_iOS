//
//  UIView+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIView+LJKit.h"

@interface UIView ()
/** 底部分割线 */
@property (nonatomic, weak) UIView *lj_bottomLineView;
@end

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

#pragma mark - 底部分割线
- (void)setLj_enableBottomLine:(BOOL)lj_enableBottomLine {
    objc_setAssociatedObject(self, @selector(setLj_enableBottomLine:), @(lj_enableBottomLine), OBJC_ASSOCIATION_ASSIGN);
    if (lj_enableBottomLine) { // 激活分割线
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lj_colorWithHexString:@"0xbbbbbb"];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1.0);
            make.left.right.bottom.equalTo(self);
        }];
        self.lj_bottomLineView = lineView;
    } else {
        [self.bottomLineView removeFromSuperview];
        self.lj_bottomLineView = nil;
    }
}
- (BOOL)lj_enableBottomLine {
    return objc_getAssociatedObject(self, @selector(setLj_enableBottomLine:));
}

- (void)setLj_bottomLineView:(UIView *)lj_bottomLineView {
    objc_setAssociatedObject(self, @selector(setLj_bottomLineView:), lj_bottomLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)lj_bottomLineView {
    return objc_getAssociatedObject(self, @selector(setLj_bottomLineView:));
}

- (void)setLj_bottomLineColor:(UIColor *)lj_bottomLineColor {
    self.lj_bottomLineView.backgroundColor = lj_bottomLineColor;
}
- (UIColor *)lj_bottomLineColor {
    return self.lj_bottomLineView.backgroundColor;
}

#pragma mark - masonry
- (MASViewAttribute *)mas_lj_safeTop {
    if (@available(iOS 11.0, *)) {
        return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTop];
    } else {
        return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTop];
    }
}

- (MASViewAttribute *)mas_lj_safeBottom {
    if (@available(iOS 11.0, *)) {
        return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
    } else {
        // Fallback on earlier versions
        return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottom];
    }
}

- (MASViewAttribute *)mas_lj_safeLeft {
    if (@available(iOS 11.0, *)) {
        return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeft];
    } else {
        return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeft];
    }
}

- (MASViewAttribute *)mas_lj_safeRight {
    if (@available(iOS 11.0, *)) {
        return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeRight];
    } else {
        return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRight];
    }
}





/**
 获取截图
 
 @return 该view的截图
 */
- (UIImage *)lj_getSnapShotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 移除所有子控件
 */
- (void)lj_removeAllSubViews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

/**
 获取view所在的控制器
 
 @return 控制器
 */
- (UIViewController *)lj_viewController {
    for (UIView* next = [self superview];next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


/**
 设置子控件约束
 */
- (void)setupSubviewLayouts {
    
}



#pragma mark - 懒加载UI
- (UIView *)bottomLineView {
    UIView *lineView = objc_getAssociatedObject(self, _cmd);
    if (!lineView) {
        lineView = [[UIView alloc] init];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1.0);
            make.left.right.bottom.equalTo(self).offset(-0.0);
        }];
        objc_setAssociatedObject(self, _cmd, lineView, OBJC_ASSOCIATION_RETAIN);
    }
    return lineView;
}
@end
