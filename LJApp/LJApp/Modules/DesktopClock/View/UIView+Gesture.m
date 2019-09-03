//
//  UIView+Gesture.m
//  LJApp
//
//  Created by developer on 2019/9/2.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)
- (void)setLj_editing:(BOOL)lj_editing {
    objc_setAssociatedObject(self, @selector(setLj_editing:), @(lj_editing), OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)isLj_editing {
    return [objc_getAssociatedObject(self, @selector(setLj_editing:)) boolValue];
}
@end
