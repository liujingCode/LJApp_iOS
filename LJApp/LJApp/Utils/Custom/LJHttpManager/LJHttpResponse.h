//
//  LJHttpResponse.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 http响应体模型
 */
@interface LJHttpResponse : NSObject
@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, strong) id data;
@end

NS_ASSUME_NONNULL_END
