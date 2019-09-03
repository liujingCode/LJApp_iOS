//
//  LJModulesGroupModel.h
//  LJApp
//
//  Created by developer on 2019/8/29.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LJModulesModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LJModulesGroupModel : NSObject
/** 模块列表 */
@property (nonatomic, copy) NSArray <LJModulesModel *>*modulesList;
/** 组名 */
@property (nonatomic, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
