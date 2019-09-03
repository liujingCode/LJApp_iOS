//
//  NSObject+LJKit.h
//  LJApp
//
//  Created by developer on 2019/8/28.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LJKit)
+ (NSDictionary *)lj_ivarList:(NSObject *)object;
+ (void)lj_methods:(NSObject *)object;
@end

NS_ASSUME_NONNULL_END
