//
//  LJShareView.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJShareViewResult;
NS_ASSUME_NONNULL_BEGIN

typedef void (^LJShareViewCallback)(LJShareViewResult *result);

/**
 自定义友盟分享View
 */
@interface LJShareView : UIView
+ (void)showWithCallback:(LJShareViewCallback)callback;
@end


/**
 分享结果
 */
@interface LJShareViewResult : NSObject
@property (nonatomic, assign) BOOL success;
@property (nonatomic, copy) NSString *message;
@end

NS_ASSUME_NONNULL_END
