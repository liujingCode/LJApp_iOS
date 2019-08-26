//
//  LJHttpManager.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "LJHttpRequest.h"
#import "LJHttpResponse.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^LJHttpCallback)(LJHttpResponse * __nullable response, NSError * __nullable error,NSURLSessionDataTask * _Nonnull task);

@interface LJHttpManager : AFHTTPSessionManager

+ (NSURLSessionDataTask *)requestWithRequest:(LJHttpRequest *)request andCallback:(LJHttpCallback)callback;
@end

NS_ASSUME_NONNULL_END
