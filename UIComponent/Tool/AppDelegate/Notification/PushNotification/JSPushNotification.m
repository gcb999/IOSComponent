//
//  JSPushNotification.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/17.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "JSPushNotification.h"

@implementation JSPushNotification


#pragma mark -注册APP

+(void)registerNotify{
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             
                                                                             settingsForTypes:(UIUserNotificationTypeSound |
                                                                                               
                                                                                               UIUserNotificationTypeAlert |
                                                                                               
                                                                                               UIUserNotificationTypeBadge)
                                                                             
                                                                             categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
        
    }else{
        
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }

}



+(void)sendNotityToke:(NSData *)deviceToken{
    
    
    NSLog(@"My token is: %@", deviceToken);
    
    
    
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    NSString *deviceToken1 = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (deviceToken1.length>0){
        USER_DEFAULT_SetObject(@"deviceToken", deviceToken1);
        [self pushNotificationResquest:deviceToken1];
    }
}


+ (void)pushNotificationResquest:(NSString *)token
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"client_token"] = token;
 
    //发送信息
    
}

@end
