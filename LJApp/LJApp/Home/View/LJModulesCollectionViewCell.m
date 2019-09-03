//
//  LJModulesCollectionViewCell.m
//  LJApp
//
//  Created by developer on 2019/8/29.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJModulesCollectionViewCell.h"

@implementation LJModulesCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviewLayouts];
    }
    return self;
}

- (void)setupSubviewLayouts {
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(4.0);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-4.0);
    }];
    
    [self.handleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(4.0);
        make.right.equalTo(self.contentView).offset(-4.0);
    }];
}


#pragma mark - 懒加载
- (UIImageView *)iconView {
    if (!_iconView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:imageView];
        _iconView = imageView;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor lj_colorWithHexString:@"0x333333"];
        label.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UIButton *)handleBtn {
    if (!_handleBtn) {
        UIButton *btn = [[UIButton alloc] init];
        btn.hidden = YES;
        [self.contentView addSubview:btn];
        _handleBtn = btn;
    }
    return _handleBtn;
}
@end
