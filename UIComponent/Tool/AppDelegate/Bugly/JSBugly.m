//
//  JSBugly.m
//  DressLink
//
//  Created by gcb999 on 16/6/21.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "JSBugly.h"

@implementation JSBugly

static JSBugly * _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}


#pragma mark -初始化Bugly
- (void)setupBugly {
    
    @try {
        
        BuglyConfig * config = [[BuglyConfig alloc] init];
        
        // Open the debug mode to print the sdk log message.
        // Default value is NO, please DISABLE it in your RELEASE version.
#if DEBUG
        config.debugMode = YES;
#endif
        
        // Open the customized log record and report, BuglyLogLevelWarn will report Warn, Error log message.
        // Default value is BuglyLogLevelSilent that means DISABLE it.
        // You could change the value according to you need.
        config.reportLogLevel = BuglyLogLevelWarn;
        
        // Open the STUCK scene data in MAIN thread record and report.
        // Default value is NO
        config.blockMonitorEnable = YES;
        
        // Set the STUCK THRESHOLD time, when STUCK time > THRESHOLD it will record an event and report data when the app launched next time.
        // Default value is 3.5 second.
        config.blockMonitorTimeout = 1.5;
        
        // Set the app channel to deployment
        config.channel = @"Bugly";
        
        // NOTE:Required
        // Start the Bugly sdk with APP_ID and your config
        [Bugly startWithAppId:BUGLY_APP_ID config:config];
        
        // Set the customizd tag thats config in your APP registerd on the  bugly.qq.com
        [Bugly setTag:1799];
        
        [Bugly setUserIdentifier:[NSString stringWithFormat:@"User: %@", [NSProcessInfo processInfo].hostName]];
        
        [Bugly setUserValue:[NSProcessInfo processInfo].processName forKey:@"App"];

        
        
    } @catch (NSException *exception) {
        
        
    } @finally {
        
        
    }
    
    
   }

#pragma mark -Bugly自定义信息


-(void)exceptionName:(NSString *)exceptionName reason:(NSString *)reason{
    @try {

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 
            // Report a customized exception object
            [Bugly reportException:[NSException exceptionWithName:exceptionName reason:reason userInfo:nil]];

        });
        
    }
    @catch (NSException *exception) {
        [Bugly reportException:exception];
    }
    @finally {
        
    }
    
    
    
}






@end
