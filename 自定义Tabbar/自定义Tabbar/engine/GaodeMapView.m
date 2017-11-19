//
//  GaodeMapView.m
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "GaodeMapView.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface GaodeMapView()
@end
@implementation GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        id obj = objc_getClass("MAMapView");
        if (obj) {
            obj = objc_msgSend(objc_msgSend(obj, sel_registerName("alloc")), sel_registerName("initWithFrame:"),frame);
            objc_setAssociatedObject(self, (__bridge const void *)@"mapView", obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
    }
    return self;
}
- (UIView *)getView{
    return objc_getAssociatedObject(self, (__bridge const void *)@"mapView");
}

@end
