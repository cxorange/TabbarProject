
//
//  IMapView.h
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol IMapView <NSObject>

- (instancetype)initWithFrame:(CGRect)frame;
- (UIView *)getView;
@end
