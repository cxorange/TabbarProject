
//
//  BDMapFactory.m
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "BDMapFactory.h"
#import "BDMapView.h"
#import <objc/runtime.h>
@implementation BDMapFactory
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame{
    id<IMapView> bdMapView = [[BDMapView alloc] initWithFrame:frame];
    return bdMapView;
}
@end
