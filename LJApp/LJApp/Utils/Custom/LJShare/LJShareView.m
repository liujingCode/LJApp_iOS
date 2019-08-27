//
//  LJShareView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJShareView.h"
#import <UMShare/UMShare.h>
#import "LJShareContentView.h"
@interface LJShareView ()<UIGestureRecognizerDelegate>
/** 内容视图 */
@property (nonatomic, weak) LJShareContentView *contentView;
/** 平台列表 */
@property (nonatomic, copy) NSArray <NSDictionary *>*sharePlatformList;
/** 分享结果的回调 */
@property (nonatomic, copy) LJShareViewCallback callback;
@end

@implementation LJShareView
+ (void)showWithCallback:(LJShareViewCallback)callback {
    LJShareView *shareView = [[LJShareView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    shareView.callback = callback;
    [[UIApplication sharedApplication].keyWindow addSubview:shareView];
    [shareView showAnimation];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        // 添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackgroundView)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        self.contentView.sharePlatformList = self.sharePlatformList;
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}

#pragma mark - 点击背景
- (void)clickBackgroundView {
    [self dismissAnimation];
}

// 展示
- (void)showAnimation {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4 ];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.contentView.lj_y = weakSelf.lj_height - weakSelf.contentView.lj_height;
        }];
        
    }];
}

// 移除
- (void)dismissAnimation {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.contentView.lj_y = weakSelf.lj_height ;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.backgroundColor = [UIColor clearColor];
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
    }];
}

// 分享结果
- (void)shareResultWithSuccess:(BOOL)success andMessage:(NSString *)message {
    LJShareViewResult *result = [[LJShareViewResult alloc] init];
    result.success = success;
    result.message = message;
    if (self.callback) {
        self.callback(result);
    }
    [self dismissAnimation];
}

#pragma mark - 分享
- (void)shareWithIndex:(NSInteger)index {
    __weak typeof(self) weakSelf = self;
    
    // 判断应用是否安装
    BOOL isInstallQQ = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
    BOOL isInstallTim = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Tim];
    BOOL isInstallWechat = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
    
    // 分享
    UMSocialMessageObject *shareObject = [UMSocialMessageObject new];
    shareObject.title = @"测试ti";
    shareObject.text = @"测试text";
    
    // 默认分享到微信
    UMSocialPlatformType type = 1;
    if (index == 0) { // QQ
        if (isInstallQQ) {
            type = UMSocialPlatformType_QQ;
        } else if (isInstallTim) {
            type = UMSocialPlatformType_Tim;
        } else {
            [self shareResultWithSuccess:NO andMessage:@"分享失败,未安装QQ"];
            return ;
        }
    }
    if (index == 1) { // 微信
        if (!isInstallWechat) {
            [self shareResultWithSuccess:NO andMessage:@"分享失败,未安装微信"];
            return ;
        }
        type = UMSocialPlatformType_WechatSession;
    }
    if (index == 2) { // 微信朋友圈
        if (!isInstallWechat) {
            [self shareResultWithSuccess:NO andMessage:@"分享失败,未安装微信"];
            return ;
        }
        type = UMSocialPlatformType_WechatTimeLine;
    }
    
    
    // 分享
    [[UMSocialManager defaultManager] shareToPlatform:type messageObject:shareObject currentViewController:self completion:^(id result, NSError *error) {
        [weakSelf dismissAnimation];
        if (error) {
            NSString *errorMessage = error.userInfo[@"message"];
            [self shareResultWithSuccess:NO andMessage:errorMessage];
            return ;
        }
        // 分享成功
        [self shareResultWithSuccess:YES andMessage:@"分享成功"];
        
    }];
}

#pragma mark - 懒加载
- (LJShareContentView *)contentView {
    if (!_contentView) {
        __weak typeof(self) weakSelf = self;
        LJShareContentView *contentView = [LJShareContentView new];
        
        CGFloat bottomSafeHeight = 0.0;
        if (@available(iOS 11.0, *)) {
            bottomSafeHeight = [UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom;
        }
        contentView.lj_height = 100.0 + bottomSafeHeight;
        contentView.lj_width = self.lj_width;
        contentView.lj_y = self.lj_bottom;
        
        contentView.actionCallback = ^(NSInteger index) {
            [weakSelf shareWithIndex:index];
        };
        [self addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (NSArray<NSDictionary *> *)sharePlatformList {
    if (!_sharePlatformList) {
        _sharePlatformList = @[@{@"name":@"QQ",@"iconName":@"share_qq_session"},
                               @{@"name":@"微信",@"iconName":@"share_wechat_session"},
                               @{@"name":@"微信朋友圈",@"iconName":@"share_wechat_friends"}];
    }
    return _sharePlatformList;
}

- (void)dealloc {
    
}
@end


#pragma mark - LJShareViewResult
@implementation LJShareViewResult

@end
