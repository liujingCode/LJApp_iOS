//
//  LJDialogWindow.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDialogWindow.h"
#import "LJDialogViewController.h"

@implementation LJDialogWindow

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.rootViewController = [LJDialogViewController new];
    }
    return self;
}
@end
