//
//  LJModulesModel.h
//  LJApp
//
//  Created by developer on 2019/8/29.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 模块模型
 */
@interface LJModulesModel : NSObject

/**
 对应的控制器类名
 */
@property (nonatomic, strong) NSString *viewControllerClassString;

/** 模块名 */
@property (nonatomic, copy) NSString *name;

/** 模块id */
@property (nonatomic, copy) NSString *modulesId;

@end

NS_ASSUME_NONNULL_END
