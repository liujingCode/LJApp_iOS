//
//  LJDialogBaseView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDialogBaseView.h"

@implementation LJDialogBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = [UIScreen mainScreen].bounds;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    return self;
}

- (void)show {
    self.backgroundColor = [UIColor lj_randomColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)dismiss {
    [self removeFromSuperview];
}

@end
