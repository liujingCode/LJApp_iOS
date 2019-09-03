//
//  LJMineController.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJMineController.h"

#import "LJShareView.h"
#import "LJDialogNormalView.h"
#import "LJSandboxViewController.h"

@interface LJMineController ()



@end

@implementation LJMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *targetVC = nil;
    // 沙盒
    LJSandBoxViewController *sandBoxVC = [LJSandBoxViewController new];
    targetVC = sandBoxVC;
    
    [self.navigationController pushViewController:targetVC animated:YES];
    [self presentViewController:targetVC animated:YES completion:nil];
    
    

}

@end
