//
//  IMapEngine.h
//  JNCharging
//
//  Created by chenxiang on 2017/10/22.
//  Copyright © 2017年 chenxiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMapFactory.h"

@interface IMapEngine : NSObject

- (id<IMapFactory>)getFactory;
- (void)engineSetting;
@end
