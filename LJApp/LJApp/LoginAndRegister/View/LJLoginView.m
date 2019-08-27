//
//  LJLoginView.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJLoginView.h"

@implementation LJLoginView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviewLayouts];
    }
    return self;
}

- (void)setupSubviewLayouts {
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(16.0);
        make.right.equalTo(self).offset(-16.0);
        make.height.mas_equalTo(50.0);
        make.top.equalTo(self).offset(40.0);
    }];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.accountTextField);
        make.top.equalTo(self.accountTextField.mas_bottom).offset(0.0);
    }];
    
    [self.forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.equalTo(self.pwdTextField.mas_bottom).offset(4.0);
        make.right.equalTo(self.pwdTextField);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.accountTextField);
        make.top.equalTo(self.pwdTextField.mas_bottom).offset(60.0);
        make.height.mas_equalTo(48.0);
    }];
    
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.loginBtn);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(20.0);
    }];
    
    [self.wechatLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginBtn).offset(20);
        make.top.equalTo(self.registerBtn.mas_bottom).offset(20.0);
        make.width.mas_equalTo(80);
    }];
    
    [self.qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loginBtn).offset(-20);
        make.centerY.width.equalTo(self.wechatLoginBtn);
    }];
}

#pragma mark - 懒加载UI
- (UITextField *)accountTextField {
    if (!_accountTextField) {
        UITextField *textField = [UITextField lj_defaultTextField];
        textField.placeholder = @"请输入账号";
        textField.lj_enableBottomLine = YES;
        [self addSubview:textField];
        _accountTextField = textField;
    }
    return _accountTextField;
}

- (UITextField *)pwdTextField {
    if (!_pwdTextField) {
        UITextField *textField = [UITextField lj_defaultTextField];
        textField.placeholder = @"请输入密码";
        textField.lj_enableBottomLine = YES;
        [self addSubview:textField];
        _pwdTextField = textField;
    }
    return _pwdTextField;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        UIButton *btn = [UIButton lj_defaultBtnWithTitle:@"登录"];
        [self addSubview:btn];
        _loginBtn = btn;
    }
    return _loginBtn;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        UIButton *btn = [UIButton lj_defaultBtnWithTitle:@"注册"];
        [self addSubview:btn];
        _registerBtn = btn;
    }
    return _registerBtn;
}

- (UIButton *)wechatLoginBtn {
    if (!_wechatLoginBtn) {
        UIButton *btn = [UIButton lj_defaultBtnWithTitle:@"微信登录"];
        [self addSubview:btn];
        _wechatLoginBtn = btn;
    }
    return _wechatLoginBtn;
}

- (UIButton *)qqLoginBtn {
    if (!_qqLoginBtn) {
        UIButton *btn = [UIButton lj_defaultBtnWithTitle:@"QQ登录"];
        [self addSubview:btn];
        _qqLoginBtn = btn;
    }
    return _qqLoginBtn;
}

- (UIButton *)forgetPwdBtn {
    if (!_forgetPwdBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lj_colorWithHexString:@"0xaaaaaa"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [self addSubview:btn];
        _forgetPwdBtn = btn;
    }
    return _forgetPwdBtn;
}

@end
