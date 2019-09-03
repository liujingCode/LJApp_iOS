//
//  LJDesktopClockControlView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDesktopClockControlView.h"
#import "LJDesktopClockControlSettingsView.h"

@interface LJDesktopClockControlView ()
/** 返回按钮 */
@property (nonatomic, weak) UIButton *backBtn;
/** 更多按钮 */
@property (nonatomic, weak) UIButton *moreBtn;
/** 设置页面 */
@property (nonatomic, weak) LJDesktopClockControlSettingsView *settingsView;
@end
@implementation LJDesktopClockControlView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lj_colorWithHexString:@"0x88000000"];
        [self setupSubviewLayouts];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapControlView:)]];
        
        // 测试
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}


- (void)setupSubviewLayouts {
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_lj_safeTop).offset(4.0);
        make.left.equalTo(self).offset(4.0);
        make.width.height.mas_equalTo(44.0);
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.width.height.equalTo(self.backBtn);
        make.right.equalTo(self).offset(-4.0);
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}


#pragma mark - 按钮点击事件
- (void)clickBackBtn:(UIButton *)sender {
    if (self.backActionCallabck) {
        self.backActionCallabck();
    }
}

- (void)clickMoreBtn:(UIButton *)sender {
    
}

// 点击控制视图
- (void)tapControlView:(UITapGestureRecognizer *)gerture {
    self.hidden = YES;
    
    if (self.viewAction) {
        self.viewAction(LJDesktopClockControlViewActionTap);
    }
}


#pragma mark - 懒加载
- (UIButton *)backBtn {
    if (!_backBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"nav_back_white"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _backBtn = btn;
    }
    return _backBtn;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"nav_more_white"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        _moreBtn = btn;
    }
    return _moreBtn;
}

- (LJDesktopClockControlSettingsView *)settingsView {
    if (!_settingsView) {
        LJDesktopClockControlSettingsView *settingsView = [LJDesktopClockControlSettingsView new];
        [self addSubview:settingsView];
        _settingsView = settingsView;
    }
    return _settingsView;
}




@end
