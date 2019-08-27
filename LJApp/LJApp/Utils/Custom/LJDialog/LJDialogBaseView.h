//
//  LJDialogBaseView.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJDialogBaseView : UIView
/** 内容视图 */
@property (nonatomic, weak) UIView *contentView;
- (void)show;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
