//
//  LJLoginController.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJLoginController.h"
#import "LJLoginView.h"
#import <UMShare/UMShare.h>

@interface LJLoginController ()
/** 登录 */
@property (nonatomic, weak) LJLoginView *loginView;
@end

@implementation LJLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.navigationController.navigationBarHidden = YES;
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_lj_safeLeft);
        make.right.equalTo(self.view.mas_lj_safeRight);
        make.top.equalTo(self.view.mas_lj_safeTop);
        make.bottom.equalTo(self.view.mas_lj_safeBottom);
    }];
    
    // 添加点击事件
    [self.loginView.loginBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.registerBtn addTarget:self action:@selector(clickRegisterBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.forgetPwdBtn addTarget:self action:@selector(clickForgetPwdBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.wechatLoginBtn addTarget:self action:@selector(clickWechatLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.qqLoginBtn addTarget:self action:@selector(clickQQLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 判断应用是否安装
    BOOL isInstallQQ = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
    BOOL isInstallTim = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Tim];
    BOOL isInstallWechat = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
    
    self.loginView.qqLoginBtn.hidden = (isInstallQQ || isInstallTim)?NO:YES;
    self.loginView.wechatLoginBtn.hidden = isInstallWechat?NO:YES;
}


#pragma mark - 点击事件
// 点击登录
- (void)clickLoginBtn:(UIButton *)sender {
    
}

// 点击注册
- (void)clickRegisterBtn:(UIButton *)sender {
    
}

// 点击忘记密码
- (void)clickForgetPwdBtn:(UIButton *)sender {
    
}

// 点击微信登录
- (void)clickWechatLoginBtn:(UIButton *)sender {
    // 登录
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:self completion:^(id result, NSError *error) {

    }];
}
// 点击QQ登录
- (void)clickQQLoginBtn:(UIButton *)sender {
    // 登录
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Tim currentViewController:self completion:^(id result, NSError *error) {

    }];
}


#pragma mark - 懒加载UI
- (LJLoginView *)loginView {
    if (!_loginView) {
        LJLoginView *loginView = [[LJLoginView alloc] init];
        [self.view addSubview:loginView];
        _loginView = loginView;
    }
    return _loginView;
}

@end
