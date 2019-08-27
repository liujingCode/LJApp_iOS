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

@interface LJMineController ()



@end

@implementation LJMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    // 分享
//    [LJShareView showWithCallback:^(LJShareViewResult * _Nonnull result) {
//        NSLog(@"分享:success = %d, message = %@",result.success,result.message);
//    }];
    
    // dialog
    LJDialogNormalView *dialog = [[LJDialogNormalView alloc] initWithTitle:@"温馨提示" andMessage:@"确定要执行这个重要操作?" andButtonTitles:@[@"确定",@"取消"] andActionCallback:^(NSInteger index) {
        
    }];
    
    [dialog show];
}

@end
