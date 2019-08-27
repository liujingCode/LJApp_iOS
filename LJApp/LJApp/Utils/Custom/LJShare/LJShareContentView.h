//
//  LJShareContentView.h
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LJShareContentView : UIView
/** 平台列表 */
@property (nonatomic, copy) NSArray <NSDictionary *>*sharePlatformList;
/** 点击回调 */
@property (nonatomic, copy) void (^actionCallback) (NSInteger index);
@end


#pragma mark - LJShareContentViewCell
@interface LJShareContentViewCell : UICollectionViewCell
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UIImageView *iconView;
@end

NS_ASSUME_NONNULL_END
