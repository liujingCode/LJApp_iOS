//
//  UIGestureRecognizer+LJKit.m
//  LJApp
//
//  Created by developer on 2019/9/2.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIGestureRecognizer+LJKit.h"

@implementation UIGestureRecognizer (LJKit)
- (LJKit_UIGestureRecognizerDirection)lj_gestureDirection {
    if (![self isKindOfClass:[UIPanGestureRecognizer class]]) {
        return LJKit_UIGestureRecognizerDirectionUnknown;
    }
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)self;
    CGPoint translationPoint = [panGesture translationInView:self.view];
    CGFloat absX = fabs(translationPoint.x);
    CGFloat absY = fabs(translationPoint.y);
    
    if (absX > absY ) {
        if (translationPoint.x < 0) { // 向左滑动
            return LJKit_UIGestureRecognizerDirectionLeft;
        }else{ //向右滑动
            return LJKit_UIGestureRecognizerDirectionRight;
        }
        
    } else{
        if (translationPoint.y<0) { // 向上滑动
            return LJKit_UIGestureRecognizerDirectionTop;
        }else{ // 向下滑动
            return LJKit_UIGestureRecognizerDirectionBottom;
        }
    }
}
@end
