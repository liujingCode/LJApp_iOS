//
//  LJBaseViewController.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJBaseViewController.h"

@interface LJBaseViewController ()

@end

@implementation LJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 默认显示导航栏
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
    // 默认为为竖屏方向
    UIInterfaceOrientation interfaceOrientation = UIInterfaceOrientationPortrait;
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}


#pragma mark - 状态栏
// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return NO;
}
// 状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 控制屏幕旋转方法
- (BOOL)shouldAutorotate{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
@end
