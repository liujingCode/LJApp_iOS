//
//  LJShareContentView.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJShareContentView.h"

@interface LJShareContentView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation LJShareContentView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self);
            make.height.mas_equalTo(100.0);
        }];
    }
    return self;
}

- (void)setSharePlatformList:(NSArray<NSDictionary *> *)sharePlatformList {
    _sharePlatformList = sharePlatformList;
    CGFloat margin = 0.0;
    CGFloat spaces = [UIScreen mainScreen].bounds.size.width * 0.1;
    // 防止布局错误
    CGFloat fixSpaces = 1.0;
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width - margin * 2 - spaces * (sharePlatformList.count - 1)) / sharePlatformList.count - fixSpaces;
    self.flowLayout.minimumLineSpacing = spaces;
    self.flowLayout.minimumInteritemSpacing = spaces;
    self.flowLayout.itemSize = CGSizeMake(itemWidth, 100.0);
    [self.collectionView reloadData];
}

#pragma mark - collectionView delegate and datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sharePlatformList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath  {
    LJShareContentViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJShareContentViewCell" forIndexPath:indexPath];
    NSDictionary *dict = self.sharePlatformList[indexPath.item];
    NSString *name = dict[@"name"];
    NSString *iconName = dict[@"iconName"];
    cell.nameLabel.text = name;
    cell.iconView.image = [UIImage imageNamed:iconName];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.actionCallback) {
        self.actionCallback(indexPath.item);
    }
}



- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _flowLayout = flowLayout;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        collectionView.scrollEnabled = NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
        [collectionView registerClass:[LJShareContentViewCell class] forCellWithReuseIdentifier:@"LJShareContentViewCell"];
        [self addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}

@end




#pragma mark - LJShareContentViewCell
@implementation LJShareContentViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.bottom.equalTo(self.contentView);
        }];
        
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(20);
            make.width.height.mas_equalTo(50.0);
        }];
    }
    return self;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lj_colorWithHexString:@"0x333333"];
        label.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:label];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        if (!_iconView) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.contentView addSubview:imageView];
            _iconView = imageView;
        }
        return _iconView;
    }
    return _iconView;
}
@end
