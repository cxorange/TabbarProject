//
//  CXTabBar.h
//  自定义Tabbar
//
//  Created by chenxiang on 2017/10/29.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CXTabBarDelegate<NSObject>
- (void)presentQrcCodeController;

@end
@interface CXTabBar : UITabBar
@property (nonatomic, weak) id<CXTabBarDelegate>tabbarDelegate;
@end
