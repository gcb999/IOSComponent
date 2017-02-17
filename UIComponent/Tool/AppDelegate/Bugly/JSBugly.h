//
//  JSBugly.h
//  DressLink
//
//  Created by gcb999 on 16/6/21.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Bugly/Bugly.h>
#define BUGLY_APP_ID @"900037531"

@interface JSBugly : NSObject

+(instancetype) shareInstance;

#pragma mark -初始化Bugly（AppDelegate)
- (void)setupBugly;

#pragma mark -Bugly自定义信息
-(void)exceptionName:(NSString *)exceptionName reason:(NSString *)reason;

@end
