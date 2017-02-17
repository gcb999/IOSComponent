//
//  JSLocalNotification.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/17.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "JSLocalNotification.h"

@implementation JSLocalNotification

+(void)showLocalNotification:(NSDictionary *)userInfo{
    
    
    @try {
        
 
    
    // 初始化本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    if (notification) {
        // 设置通知的提醒时间
        //        NSDate *currentDate   = [NSDate date];
        //        notification.timeZone = [NSTimeZone defaultTimeZone]; // 使用本地时区
        //        notification.fireDate = [currentDate dateByAddingTimeInterval:5.0];
        //
        //        // 设置重复间隔
        //        notification.repeatInterval = kCFCalendarUnitDay;
        
        if (IS_NSString([[userInfo objectForKey:@"aps"] objectForKey:@"alert"])) {
            notification.alertBody = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
        }else
        {
            notification.alertBody = @"";
            
        }
        
        
        // 通知提示音 使用默认的
        notification.soundName= UILocalNotificationDefaultSoundName;
        
        // 设置应用程序右上角的提醒个数
        //        notification.applicationIconBadgeNumber++;
        
        // 设定通知的userInfo，用来标识该通知
        //        NSMutableDictionary *aUserInfo = [[NSMutableDictionary alloc] init];
        //        aUserInfo[kLocalNotificationID] = @"LocalNotificationID";
        //        notification.userInfo = aUserInfo;
        
        // 将通知添加到系统中
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
    
    } @catch (NSException *exception) {
        
    } @finally {
        
    }

}

@end
