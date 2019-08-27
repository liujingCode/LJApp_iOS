//
//  UIButton+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UIButton+LJKit.h"

@implementation UIButton (LJKit)
+ (instancetype)lj_defaultBtnWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.showsTouchWhenHighlighted = NO;
    btn.backgroundColor = [UIColor orangeColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.lj_cornerRadius = 5.0;
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}
@end
