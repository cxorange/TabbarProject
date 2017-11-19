//
//  IMapFactory.h
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapView.h"
@protocol IMapFactory <NSObject>
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame;
@end
