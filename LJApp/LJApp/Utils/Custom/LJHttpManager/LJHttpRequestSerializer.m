//
//  LJRequestSerializer.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJHttpRequestSerializer.h"

@implementation LJHttpRequestSerializer
- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                 URLString:(NSString *)URLString
                                parameters:(nullable id)parameters
                                     error:(NSError * _Nullable __autoreleasing *)error {
    NSParameterAssert(method);
    NSParameterAssert(URLString);
    NSURL *url = [NSURL URLWithString:URLString];
    NSParameterAssert(url);
    NSMutableURLRequest *mutableRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    mutableRequest.HTTPMethod = method;
    NSMutableDictionary *allParam = [NSMutableDictionary dictionaryWithCapacity:5];
    if (parameters) {
        [allParam addEntriesFromDictionary:parameters];
    }
    mutableRequest = [[self requestBySerializingRequest:mutableRequest withParameters:allParam error:error] mutableCopy];
    NSLog(@"httpRequest == url:%@ \n pararms:%@", url.absoluteString, allParam);
    return mutableRequest;
}
@end
