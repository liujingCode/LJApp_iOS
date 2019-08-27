//
//  LJLoginView.h
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJLoginView : UIView
/** 账号 */
@property (nonatomic, weak) UITextField *accountTextField;
/** 密码 */
@property (nonatomic, weak) UITextField *pwdTextField;
/** 登录 */
@property (nonatomic, weak) UIButton *loginBtn;
/** 忘记密码 */
@property (nonatomic, weak) UIButton *forgetPwdBtn;
/** 注册 */
@property (nonatomic, weak) UIButton *registerBtn;
/** 微信登录 */
@property (nonatomic, weak) UIButton *wechatLoginBtn;
/** qq登录 */
@property (nonatomic, weak) UIButton *qqLoginBtn;
@end

NS_ASSUME_NONNULL_END
