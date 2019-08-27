//
//  UITextField+LJKit.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "UITextField+LJKit.h"

@implementation UITextField (LJKit)


+ (instancetype)lj_defaultTextField {
    UITextField *textField = [UITextField new];
    textField.font = [UIFont systemFontOfSize:15.0];
    textField.textColor = [UIColor lj_colorWithHexString:@"0x333333"];
    return textField;
}
@end
