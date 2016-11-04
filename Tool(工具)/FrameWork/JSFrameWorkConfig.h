//
//  JSFrameWork.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/4.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger,JSFrameWorkState) {
    /** 侧栏*/
    JSFrameWork_Side = 1,
    /** 横栏  */
    JSFrameWork_Tabbar=2,

};



@interface JSFrameWorkConfig : NSObject


+(UIViewController *)rootViewController:(JSFrameWorkState)state;


@end

/*--------------用法

 [self.window setRootViewController:[JSFrameWorkConfig rootViewController:JSFrameWork_Tabbar]];

*/