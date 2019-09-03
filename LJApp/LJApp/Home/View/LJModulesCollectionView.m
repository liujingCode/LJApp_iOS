//
//  LJModulesCollectionView.m
//  LJApp
//
//  Created by developer on 2019/8/29.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJModulesCollectionView.h"
#import "LJModulesCollectionViewCell.h"

@interface LJModulesCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** 布局风格 */
@property (nonatomic, assign) LJModulesCollectionViewStyle layoutStyle;
/** 长按重排手势 */
@property (nonatomic, strong) UILongPressGestureRecognizer *longGesture;
/** 当前选中的模型 */
@property (nonatomic, strong) id currentLongGestureModel;
@end

@implementation LJModulesCollectionView
+ (instancetype)collectionViewWithFrame:(CGRect)frame andStyle:(LJModulesCollectionViewStyle)style; {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 每行4个
    NSInteger column = 4;
    // 水平间距
    CGFloat horizontalMargin = LJKit_kWidth_screen * 0.04;
    // 垂直间距
    CGFloat verticalMargin = 20.0;
    // 内缩紧
    UIEdgeInsets sectionInset = UIEdgeInsetsMake(20.0, 10.0, 10.0, 10.0);
    
    CGFloat itemWidth = (LJKit_kWidth_screen - horizontalMargin * (column - 1) - sectionInset.left - sectionInset.right) / column;
    CGFloat itemHeight = 60.0;
    
    flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight);
    flowLayout.minimumLineSpacing = verticalMargin;
    flowLayout.minimumInteritemSpacing = horizontalMargin;
    flowLayout.sectionInset = sectionInset;
    
    LJModulesCollectionView *collectionView = [[LJModulesCollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = collectionView;
    collectionView.dataSource = collectionView;
    [collectionView registerClass:[LJModulesCollectionViewCell class] forCellWithReuseIdentifier:@"LJModulesCollectionViewCell"];
    
    // 长按重排
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:collectionView action:@selector(longGestureCollectionView:)];
    [collectionView addGestureRecognizer:longGesture];
    
    collectionView.layoutStyle = style;
    return collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)setDataList:(NSArray<LJModulesGroupModel *> *)dataList {
    _dataList = dataList;
    [self reloadData];
}


#pragma mark - 长按
- (void)longGestureCollectionView:(UILongPressGestureRecognizer *)gesture {
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [self indexPathForItemAtPoint:[gesture locationInView:self]];
                LJModulesCollectionViewCell *cell = (LJModulesCollectionViewCell *)[self cellForItemAtIndexPath:selectIndexPath];
                if (cell) {
                    self.currentLongGestureModel = self.dataList[selectIndexPath.section].modulesList[selectIndexPath.row];
                }
                NSLog(@"selectedCell = %@", cell);
                // 拽起变大动画效果
                [UIView animateWithDuration:0.3 animations:^{
                    [cell setTransform:CGAffineTransformMakeScale(1.2, 1.2)];
                }];
                //开始移动
                [self beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            //更新移动的位置
            [self updateInteractiveMovementTargetPosition:[gesture locationInView:gesture.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            //结束移动
            [self endInteractiveMovement];
            break;
        }
        default: [self cancelInteractiveMovement];
            break;
    }
}



#pragma mark - collectionView delegate and datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList[section].modulesList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJModulesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJModulesCollectionViewCell" forIndexPath:indexPath];
    LJModulesModel *model = self.dataList[indexPath.section].modulesList[indexPath.item];
    cell.nameLabel.text = model.name;
    cell.backgroundColor = [UIColor lj_randomColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.actionCallback) {
        return;
    }
    LJModulesModel *model = self.dataList[indexPath.section].modulesList[indexPath.item];
    self.actionCallback(LJModulesCollectionViewModulesActionShow, model);
}


- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    LJModulesModel *fromModel = self.dataList[sourceIndexPath.section].modulesList[sourceIndexPath.row];
//    LJModulesModel *toModel = self.dataList[destinationIndexPath.section].modulesList[destinationIndexPath.row];
//    NSLog(@"sourceIndexPath section = %zd, row = %zd, fromModel = %@",sourceIndexPath.section,sourceIndexPath.row,fromModel);
//    NSLog(@"destinationIndexPath section = %zd, row = %zd, toModel = %@",destinationIndexPath.section,destinationIndexPath.row,toModel);
    
//    [self reloadData];
    
    
    
    NSMutableArray *tempFromGroup = [NSMutableArray arrayWithArray:self.dataList[sourceIndexPath.section].modulesList];
    NSMutableArray *tempToGroup = [NSMutableArray arrayWithArray:self.dataList[destinationIndexPath.section].modulesList];
    NSMutableArray <LJModulesGroupModel *>*tempArr = [NSMutableArray arrayWithArray:self.dataList];
    
    LJModulesModel *fromModel = tempFromGroup[sourceIndexPath.item];
    LJModulesModel *toModel = tempToGroup[destinationIndexPath.item];
    
    if (sourceIndexPath.section == destinationIndexPath.section) { // 同一组
        tempFromGroup[sourceIndexPath.item] = toModel;
        tempFromGroup[destinationIndexPath.item] = fromModel;
        tempArr[sourceIndexPath.section].modulesList = [NSArray arrayWithArray:tempFromGroup];
    } else {
        tempFromGroup[sourceIndexPath.item] = toModel;
        tempToGroup[destinationIndexPath.item] = fromModel;
        
        tempArr[sourceIndexPath.section].modulesList = [NSArray arrayWithArray:tempFromGroup];
        tempArr[destinationIndexPath.section].modulesList = [NSArray arrayWithArray:tempToGroup];
    }
    self.dataList = [NSArray arrayWithArray:tempArr];
    [self reloadData];
}

@end
