//
//  LJMainTabBarController.m
//  LJApp
//
//  Created by developer on 2019/8/26.
//  Copyright © 2019 liujing. All rights reserved.
//

#import "LJMainTabBarController.h"
#import "LJMainNavigationController.h"
#import "LJHomeController.h"
#import "LJDiscoverCOntroller.h"
#import "LJMineController.h"

@interface LJMainTabBarController ()

@end

@implementation LJMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LJHomeController *homeVC = [LJHomeController new];
    LJDiscoverController *discoverVC = [LJDiscoverController new];
    LJMineController *mineVC = [LJMineController new];
    
    NSArray *controllers = @[homeVC,discoverVC,mineVC];
    NSArray *titles = @[@"首页",@"发现",@"我的"];
    NSArray *imageNames = @[@"首页",@"发现",@"我的"];
    NSArray *selectedImageNames = @[@"首页",@"发现",@"我的"];
    
    for (int i = 0; i < titles.count; i ++) {
        UIViewController *controller = controllers[i];
        NSString *title = titles[i];
        NSString *imageName = imageNames[i];
        NSString *selectedImageName = selectedImageNames[i];
        
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:[UIImage imageNamed:selectedImageName]];
        
        LJMainNavigationController *nav = [[LJMainNavigationController alloc] initWithRootViewController:controller];
        [nav setTabBarItem:item];
        
        
        [self addChildViewController:nav];
        
        
    }
    self.selectedIndex = 0;
    [self.delegate tabBarController:self didSelectViewController:homeVC];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

}

@end
