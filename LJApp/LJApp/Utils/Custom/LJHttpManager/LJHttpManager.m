//
//  LJHttpManager.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJHttpManager.h"
#import "LJHttpRequestSerializer.h"
#import "LJHttpResponseSerializer.h"

@implementation LJHttpManager
+ (instancetype)shareManager {
    static LJHttpManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LJHttpManager alloc] initWithBaseURL:nil];
        manager.requestSerializer = [LJHttpRequestSerializer serializer];
        manager.responseSerializer = [LJHttpResponseSerializer serializer];
    });
    return manager;
}

+ (NSURLSessionDataTask *)requestWithRequest:(LJHttpRequest *)request andCallback:(LJHttpCallback)callback {
    if (!request) {
        return nil;
    }
    LJHttpManager *manager = [LJHttpManager shareManager];
    
    // get 或 下载
    if ((request.requestType == LJHttpRequestTypeGet) || (request.requestType == LJHttpRequestTypeDownload)) {
        return [manager GET:request.urlStr parameters:request.params progress:^(NSProgress * _Nonnull downloadProgress) {
            if (request.progressCallback) {
                request.progressCallback(downloadProgress.fractionCompleted);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self setupCallbackWithResponse:responseObject andError:nil andTask:task andCallback:callback];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self setupCallbackWithResponse:nil andError:error andTask:task andCallback:callback];
        }];
    }
    
    // post
    if (request.requestType == LJHttpRequestTypePost) { // post
        return [manager POST:request.urlStr parameters:request.params progress:^(NSProgress * _Nonnull uploadProgress) {
            if (request.progressCallback) {
                request.progressCallback(uploadProgress.fractionCompleted);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self setupCallbackWithResponse:responseObject andError:nil andTask:task andCallback:callback];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self setupCallbackWithResponse:nil andError:error andTask:task andCallback:callback];
        }];
    }
    
    // 上传
    if (request.requestType == LJHttpRequestTypeUpload) {
        return [manager POST:request.urlStr parameters:request.params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            for (LJHttpUploadModel *uploadModel in request.uploadFileList) {
                [formData appendPartWithFileData:uploadModel.data name:uploadModel.key fileName:uploadModel.fileName mimeType:uploadModel.fileType];
            }
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            if (request.progressCallback) {
                request.progressCallback(uploadProgress.fractionCompleted);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self setupCallbackWithResponse:responseObject andError:nil andTask:task andCallback:callback];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self setupCallbackWithResponse:nil andError:error andTask:task andCallback:callback];
        }];
    }
    return nil;
}


#pragma mark - 处理回调
// 统一处理网络请求回调
+ (void)setupCallbackWithResponse:(LJHttpResponse * _Nullable )response andError:(NSError * _Nullable)error andTask:(NSURLSessionDataTask *)task andCallback:(LJHttpCallback)callback{
    // 处理回调
    if (!callback) {
        return;
    }
    callback(response,error,task);
}
@end
