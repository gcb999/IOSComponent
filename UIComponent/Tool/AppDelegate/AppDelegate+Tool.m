//
//  AppDelegate+Tool.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/17.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "AppDelegate+Tool.h"
#import "JSLocalNotification.h"
#import "JSPushNotification.h"
#import "JSBugly.h"
#import "JSNewFeature.h"

@implementation AppDelegate (Tool)


#pragma mark -初始化工作


-(void)initialize{
    
   
    //推送
    [JSPushNotification registerNotify];
    
    //配置Bugly
    [[JSBugly shareInstance] setupBugly];
    
    
    
}


#pragma mark -远程通知


//1： 获取本地客户端Toke
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{

    [JSPushNotification sendNotityToke:deviceToken];
}



//2：获取远程服务器推送信息

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{

    [JSLocalNotification showLocalNotification:userInfo];

}


@end
