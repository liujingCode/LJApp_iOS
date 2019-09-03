//
//  LJModulesCollectionViewCell.h
//  LJApp
//
//  Created by developer on 2019/8/29.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJModulesCollectionViewCell : UICollectionViewCell
/** 模块图标 */
@property (nonatomic, weak) UIImageView *iconView;
/** 模块名 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 删除或添加的按钮 */
@property (nonatomic, weak) UIButton *handleBtn;

@end

NS_ASSUME_NONNULL_END
