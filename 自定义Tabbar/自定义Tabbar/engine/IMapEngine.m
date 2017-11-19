
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

@implementation IMapEngine
- (id<IMapFactory>)getFactory{
    NSArray * objArray = [self engineGetObjectArray];
    return [[[objArray firstObject] objectForKey:@"isOpen"] boolValue]? [[BDMapFactory alloc] init]:[[GaodeMapFactory alloc] init];
}
- (void)engineSetting{
    NSArray * objArray = [self engineGetObjectArray];
    NSDictionary * mapObject = [objArray firstObject];
    if ([[mapObject objectForKey:@"isOpen"] boolValue]) {
        id obj = objc_getClass("BMKMapManager");
        obj = objc_msgSend(objc_msgSend(obj, sel_registerName("alloc")), sel_registerName("init"));

        // 如果要关注网络及授权验证事件，请设定generalDelegate参数
        BOOL ret = objc_msgSend(obj, sel_registerName("start:generalDelegate:"),[mapObject objectForKey:@"appKey"],nil);
        
        if (!ret) {
            NSLog(@"manager start failed!");
        }
    }else{
        mapObject = [objArray lastObject];
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
- (NSArray *)engineGetObjectArray{
    NSString     * kInfoPlistPath = [[NSBundle mainBundle] pathForResource:@"MapInfo.plist" ofType:nil];
    NSDictionary * kInfoPlistDic  = [NSDictionary dictionaryWithContentsOfFile:kInfoPlistPath];
    NSArray      * kInfoPlistMapObjectsArray = kInfoPlistDic[@"MapArray"];
    
    return kInfoPlistMapObjectsArray;
}
@end
