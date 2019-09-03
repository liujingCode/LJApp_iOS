//
//  LJModulesCollectionView.h
//  LJApp
//
//  Created by developer on 2019/8/29.
//  Copyright © 2019 liujing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJModulesGroupModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, LJModulesCollectionViewStyle) {
    LJModulesCollectionViewStyleDefault = 0,
};


typedef NS_ENUM(NSUInteger, LJModulesCollectionViewModulesAction) {
    LJModulesCollectionViewModulesActionShow,
    LJModulesCollectionViewModulesActionDelete,
};

typedef void (^LJModulesCollectionViewActionCallback)(LJModulesCollectionViewModulesAction action, LJModulesModel *modulesModel);

@interface LJModulesCollectionView : UICollectionView

/** 数据 */
@property (nonatomic, copy) NSArray <LJModulesGroupModel *>* dataList;

/** 点击模块的回调 */
@property (nonatomic, copy) LJModulesCollectionViewActionCallback actionCallback;

/**
 初始化

 @param frame frame
 @param style 布局类型
 @return collectionView
 */
+ (instancetype)collectionViewWithFrame:(CGRect)frame andStyle:(LJModulesCollectionViewStyle)style;

@end

NS_ASSUME_NONNULL_END
