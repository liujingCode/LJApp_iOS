//
//  LJDesktopClockContentView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDesktopClockContentView.h"

@interface LJDesktopClockContentView ()
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 日期 */
@property (nonatomic, weak) UILabel *dateLabel;

@end

@implementation LJDesktopClockContentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

@end
