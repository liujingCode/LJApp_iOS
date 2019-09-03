//
//  LJHomeController.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJHomeController.h"

#import "LJModulesCollectionView.h"

@interface LJHomeController ()
/** 数据 */
@property (nonatomic, copy) NSArray <LJModulesGroupModel *>* dataList;
@property (nonatomic, weak) LJModulesCollectionView *collectionView;
@end

@implementation LJHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_lj_safeTop);
        make.bottom.equalTo(self.view.mas_lj_safeBottom);
        make.left.equalTo(self.view.mas_lj_safeLeft);
        make.right.equalTo(self.view.mas_lj_safeRight);
    }];
    self.collectionView.dataList = self.dataList;
    
    __weak typeof(self) weakSelf = self;
    self.collectionView.actionCallback = ^(LJModulesCollectionViewModulesAction action, LJModulesModel * _Nonnull modulesModel) {
        NSLog(@"点击了模块 name = %@", modulesModel.name);
        Class class = NSClassFromString(modulesModel.viewControllerClassString);
        UIViewController *viewController = [class new];
        viewController.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:viewController animated:YES];
    } ;
}





#pragma mark - 懒加载
- (LJModulesCollectionView *)collectionView {
    if (!_collectionView) {
        LJModulesCollectionView *collectionView = [LJModulesCollectionView collectionViewWithFrame:CGRectZero andStyle:LJModulesCollectionViewStyleDefault];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}


- (NSArray<LJModulesGroupModel *> *)dataList {
    if (!_dataList) {
        
        LJModulesModel *model = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        model.name = @"桌面时钟";
        
        LJModulesModel *testModel1 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel1.name = @"桌面时钟1";
        
        LJModulesModel *testModel2 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel2.name = @"桌面时钟2";
        
        LJModulesModel *testModel3 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel3.name = @"桌面时钟3";
        
        LJModulesModel *testModel4 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel4.name = @"桌面时钟4";
        
        
        LJModulesGroupModel *groupModel = [LJModulesGroupModel new];
        groupModel.name = @"全部应用";
        groupModel.modulesList = @[model,testModel1,testModel2,testModel3,testModel4];
        
        
        //
        LJModulesModel *testModel21 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel21.name = @"桌面时钟21";
        
        LJModulesModel *testModel22 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel22.name = @"桌面时钟22";
        
        LJModulesModel *testModel23 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel23.name = @"桌面时钟23";
        
        LJModulesModel *testModel24 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel24.name = @"桌面时钟24";
        
        LJModulesModel *testModel25 = [LJModulesModel new];
        model.viewControllerClassString = @"LJDesktopClockController";
        testModel25.name = @"桌面时钟25";
        
        
        LJModulesGroupModel *testGroupModel1 = [LJModulesGroupModel new];
        testGroupModel1.name = @"最近使用";
        testGroupModel1.modulesList = @[testModel21,testModel22,testModel23,testModel24,testModel25];
        
        _dataList = @[groupModel,testGroupModel1];
    }
    return _dataList;
}

@end
