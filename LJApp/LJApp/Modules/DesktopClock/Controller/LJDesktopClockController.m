//
//  LJDesktopClockController.m
//  LJApp
//
//  Created by developer on 2019/8/27.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJDesktopClockController.h"
#import "LJDesktopClockContentView.h"
#import "LJDesktopClockControlView.h"

@interface LJDesktopClockController ()
/** 内容视图 */
@property (nonatomic, weak) LJDesktopClockContentView *contentView;
/** 控制视图 */
@property (nonatomic, weak) LJDesktopClockControlView *controlView;
@end

@implementation LJDesktopClockController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_lj_safeLeft);
        make.right.equalTo(self.view.mas_lj_safeRight);
        make.top.equalTo(self.view.mas_lj_safeTop);
        make.bottom.equalTo(self.view.mas_lj_safeBottom);
    }];
    
    [self.controlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_lj_safeLeft);
        make.right.equalTo(self.view.mas_lj_safeRight);
        make.top.equalTo(self.view.mas_lj_safeTop);
        make.bottom.equalTo(self.view.mas_lj_safeBottom);
    }];
    
    
    __weak typeof(self) weakSelf = self;
    self.controlView.backActionCallabck = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    
    self.contentView.viewAction = ^(LJDesktopClockContentViewAction action) {
        weakSelf.controlView.hidden = !weakSelf.controlView.hidden;
        [weakSelf setNeedsStatusBarAppearanceUpdate];
    };
    self.controlView.viewAction = ^(LJDesktopClockControlViewAction action) {
        [weakSelf setNeedsStatusBarAppearanceUpdate];
    };
}



#pragma mark - 父类方法重载
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 透明导航栏
//    [self.navigationController.navigationBar setTranslucent:true];
    self.navigationController.navigationBar.translucent= YES;
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
//    // 设置为横屏方向
//    UIInterfaceOrientation interfaceOrientation = UIInterfaceOrientationLandscapeLeft;
//    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
//    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
//    return _controlView.hidden;
    return YES;
}

#pragma mark -  屏幕旋转
// 当前支持的旋转类型
-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
    return UIInterfaceOrientationMaskAll;
}

// 是否支持旋转
- (BOOL)shouldAutorotate {
    return YES;
}

//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return  UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
//}





#pragma mark - 懒加载
- (LJDesktopClockContentView *)contentView {
    if (!_contentView) {
        LJDesktopClockContentView *contentView = [LJDesktopClockContentView new];
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

- (LJDesktopClockControlView *)controlView {
    if (!_controlView) {
        LJDesktopClockControlView *controlView = [LJDesktopClockControlView new];
        [self.view addSubview:controlView];
        _controlView = controlView;
    }
    return _controlView;
}

- (void)dealloc {
    [self.contentView.displayLink invalidate];
    self.contentView.displayLink = nil;
}

@end
