
//
//  BDMapView.m
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "BDMapView.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface BDMapView()

@end
@implementation BDMapView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        id obj = objc_getClass("BMKMapView");
        if (obj) {
            obj = objc_msgSend(obj, @selector(alloc));
            obj = objc_msgSend(obj, @selector(initWithFrame:),frame);
            //将mapView添加到当前对象
            objc_setAssociatedObject(self, (__bridge const void *)@"mapView", obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
    }
    return self;
    
}
- (UIView *)getView{
    //获取mapView
    id obj = objc_getAssociatedObject(self, (__bridge const void *)@"mapView");
    if (obj) {
        return obj;
    }
    return nil;
}
@end
