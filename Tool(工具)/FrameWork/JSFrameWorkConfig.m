//
//  JSFrameWork.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/4.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSFrameWorkConfig.h"
#import "JSSideSlippingControllerConfig.h"
#import "JSTabBarControllerConfig.h"




@implementation JSFrameWorkConfig


+(UIViewController *)rootViewController:(JSFrameWorkState)state{
    
    if (state==JSFrameWork_Side) {//侧栏
        
        Class leftClass=NSClassFromString(@"LeftViewController");
        Class centerClass=NSClassFromString(@"MainViewController");
        
        JSSideSlippingControllerConfig* config= [[JSSideSlippingControllerConfig alloc] initWithLeftPanel:leftClass centerPanel:centerClass rightPanel:nil];

        return config.sidePanelController;
        
    }
    else{
        
       
        return  [JSTabBarControllerConfig shareInstance].tabBarController;
        
    }
    
    
    
}


#pragma mark -单例类
static JSFrameWorkConfig * _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [JSFrameWorkConfig shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSFrameWorkConfig shareInstance] ;
}


@end
