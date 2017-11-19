
//
//  IMapEngine.m
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import "IMapEngine.h"
#import "BDMapFactory.h"
#import "GaodeMapFactory.h"

#import <objc/runtime.h>
#import <objc/message.h>
static NSString     *  kInfoPlistPath;
static NSDictionary *  kInfoPlistDic;
static NSArray      *  kInfoPlistMapObjectsArray;

@implementation IMapEngine
- (instancetype)init{
    if (self = [super init]) {
        kInfoPlistPath = [[NSBundle mainBundle] pathForResource:@"MapInfo.plist" ofType:nil];
        kInfoPlistDic  = [NSDictionary dictionaryWithContentsOfFile:kInfoPlistPath];
        kInfoPlistMapObjectsArray = kInfoPlistDic[@"MapArray"];
    }
    return self;
}
- (id<IMapFactory>)getFactory{
    return [[[kInfoPlistMapObjectsArray firstObject] objectForKey:@"isOpen"] boolValue]? [[BDMapFactory alloc] init]:[[GaodeMapFactory alloc] init];
}
- (void)engineSetting{
    NSDictionary * mapObject = [kInfoPlistMapObjectsArray firstObject];
    if ([[mapObject objectForKey:@"isOpen"] boolValue]) {
        id obj = objc_getClass("BMKMapManager");
        obj = objc_msgSend(objc_msgSend(obj, sel_registerName("alloc")), sel_registerName("init"));

        // 如果要关注网络及授权验证事件，请设定generalDelegate参数
        BOOL ret = objc_msgSend(obj, sel_registerName("start:generalDelegate:"),[mapObject objectForKey:@"appKey"],nil);
        
        if (!ret) {
            NSLog(@"manager start failed!");
        }
    }else{
        mapObject = [kInfoPlistMapObjectsArray lastObject];
        //获取类
        Class class = [objc_getClass("AMapServices") class];
        if (class) {
            //访问类方法
            id obj    = method_invoke(class, class_getClassMethod(class, sel_registerName("sharedServices")));
            //获取属性
            Ivar ivar = class_getClassVariable(obj, "_apiKey");
            //给属性赋值
            object_setIvar(obj, ivar,mapObject[@"appKey"]);
        }
        
    }
}

@end
