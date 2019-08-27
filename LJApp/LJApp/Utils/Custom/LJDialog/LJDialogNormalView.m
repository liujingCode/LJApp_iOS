//
//  LJDialogNormalView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDialogNormalView.h"


@interface LJDialogNormalContentView : UIView
/** 标题 */
@property (nonatomic, weak) UILabel *titleLabel;
/** 文本消息 */
@property (nonatomic, weak) UILabel *messageLabel;
/** 按钮父控件 */
@property (nonatomic, weak) UIStackView *stackView;
@end

@interface LJDialogNormalView ()
@property (nonatomic, weak) LJDialogNormalContentView *normalContentView;
@end

@implementation LJDialogNormalView
- (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message andButtonTitles:(NSArray <NSString *>*)buttonTitles andActionCallback:(void (^) (NSInteger index))actionCallback {
    self.normalContentView.titleLabel.text = title;
    self.normalContentView.messageLabel.text = message;
    return self;
}


- (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message {
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


- (UIButton *)addButtonWithTitle:(NSString *)title andActionCallback:(void (^) (void))actionCallback {
    return nil;
}




#pragma mark - 重写父类方法
- (UIView *)contentView {
    return self.normalContentView;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel {
    return self.normalContentView.titleLabel;
}
- (UILabel *)messageLabel {
    return self.normalContentView.messageLabel;
}
- (LJDialogNormalContentView *)normalContentView {
    if (!_normalContentView) {
        LJDialogNormalContentView *contentView = [LJDialogNormalContentView new];
        [self addSubview:contentView];
        _normalContentView = contentView;
    }
    return _normalContentView;
}

@end



#pragma mark - LJDialogNormalContentView
@implementation LJDialogNormalContentView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviewLayouts];
    }
    return self;
}

- (void)setupSubviewLayouts {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.equalTo(self);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.0);
        make.centerX.equalTo(self);
        make.left.equalTo(self).offset(10.0);
        make.right.equalTo(self).offset(-10);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor lj_colorWithHexString:@"#333333"];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor lj_colorWithHexString:@"#999999"];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        [self addSubview:label];
        _messageLabel = label;
    }
    return _messageLabel;
}


@end
