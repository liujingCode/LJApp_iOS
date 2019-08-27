//
//  LJDialogNormalView.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDialogBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LJDialogNormalView : LJDialogBaseView
/** 标题 */
@property (nonatomic, weak) UILabel *titleLabel;
/** 文本消息 */
@property (nonatomic, weak) UILabel *messageLabel;

/**
 初始化
 
 @param title 标题
 @param message 文本
 @param buttonTitles 按钮标题
 @param actionCallback 点击按钮的回调
 @return dialog实体
 */
- (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message andButtonTitles:(NSArray <NSString *>*)buttonTitles andActionCallback:(void (^) (NSInteger index))actionCallback;

/**
  初始化

 @param title 标题
 @param message 文本
 @return dialog实体
 */
- (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message;


/**
 添加按钮

 @param title 按钮标题
 @param actionCallback 点击按钮的回调
 @return 按钮实体
 */
- (UIButton *)addButtonWithTitle:(NSString *)title andActionCallback:(void (^) (void))actionCallback;

@end

NS_ASSUME_NONNULL_END
