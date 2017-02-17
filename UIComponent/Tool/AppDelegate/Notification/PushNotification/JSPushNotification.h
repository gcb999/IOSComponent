//
//  JSPushNotification.h
//  IOS_Compon
//
//  Created by gcb999 on 17/2/17.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSPushNotification : NSObject

+(void)registerNotify;

+(void)sendNotityToke:(NSData *)deviceToken;

@end
