//
//  TabBarViewController.m
//  自定义Tabbar
//
//  Created by chenxiang on 2017/10/29.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "CXTabBar.h"
@interface TabBarViewController ()<UITabBarDelegate,UITabBarControllerDelegate,CXTabBarDelegate>
@property (nonatomic, strong) CXTabBar * cxTabBar;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    ViewController * vc = [[ViewController alloc] init];
    vc.title = @"首页";
    vc.view.backgroundColor = [UIColor redColor];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:vc.title image:[UIImage imageNamed:@"main.png"] selectedImage:[UIImage imageNamed:@"main_selected"]];

    ViewController2 * vc2 = [[ViewController2 alloc] init];
    vc2.title = @"我的";
    vc2.view.backgroundColor = [UIColor greenColor];

    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:vc2.title image:[UIImage imageNamed:@"setting"] selectedImage:[UIImage imageNamed:@"setting_selected"]];

    self.viewControllers = @[vc,vc2];
    [self setValue:self.cxTabBar forKey:@"tabBar"];
    
    self.selectedIndex = 1;
    self.selectedIndex = 0;
    self.title = self.selectedViewController.title;
    
    self.hidesBottomBarWhenPushed = YES;
}


- (void)presentQrcCodeController{
    [self presentViewController:[[ViewController1 alloc] init] animated:YES completion:nil];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    tabBarController.title = viewController.title;
}

- (CXTabBar *)cxTabBar{
    if (!_cxTabBar) {
        _cxTabBar = [[CXTabBar alloc] init];
        _cxTabBar.bounds = self.tabBar.bounds;
        _cxTabBar.tabbarDelegate = self;
    }
    return _cxTabBar;
}

@end
