
//
//  GaodeMapFactory.m
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "GaodeMapView.h"
@implementation GaodeMapFactory
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame{
    return [[GaodeMapView alloc] initWithFrame:frame];
}
@end
