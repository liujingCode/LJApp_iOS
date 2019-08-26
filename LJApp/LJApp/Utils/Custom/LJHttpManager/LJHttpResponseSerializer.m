//
//  LJResponseSerializer.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJHttpResponseSerializer.h"
#import "LJHttpResponse.h"

@implementation LJHttpResponseSerializer
- (instancetype)init {
    if (self = [super init]) {
        NSMutableSet *contentTypes = [NSMutableSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
        [contentTypes setByAddingObjectsFromSet:self.acceptableContentTypes];
        self.acceptableContentTypes = contentTypes;
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    id responseObject = [super responseObjectForResponse:response data:data error:error];
    
    LJHttpResponse *ljResponse = [LJHttpResponse yy_modelWithJSON:responseObject];
    
#ifdef DEBUG
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[ljResponse yy_modelToJSONObject] options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"httpResponse == url:%@ \nBody: \n%@", response.URL.absoluteString, jsonString);
#endif
    return ljResponse;
}
@end
