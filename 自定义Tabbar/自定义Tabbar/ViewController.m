//
//  ViewController.m
//  自定义Tabbar
//
//  Created by chenxiang on 2017/10/29.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "IMapEngine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"首页";
//    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(100, 100, 40, 40);
//    button.backgroundColor = [UIColor whiteColor];
//    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];

    IMapEngine * mapEngine     = [[IMapEngine alloc] init];
    id<IMapFactory> mapFactory = [mapEngine  getFactory];
    id<IMapView> mapView       = [mapFactory getMapViewWithFrame:self.view.bounds];
    [self.view addSubview:[mapView getView]];
}
- (void)btnClick:(UIButton *)sender{
    [self.navigationController pushViewController:[[ViewController1 alloc] init]animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
