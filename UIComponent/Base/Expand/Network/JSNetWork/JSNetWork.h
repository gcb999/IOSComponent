//
//  DLNetWoring.h
//  DealSale
//
//  Created by gcb999 on 15/8/6.
//  Copyright (c) 2015年 com.sailvan.dealsale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSError.h"
#import "AFHTTPSessionManager.h"
#import "JSUserSingletonModel.h"
//#import "Reachability.h"



#define KCBNetWoringTag 100000
static NSString *contentType=@"application/json";//@"text/html"



@interface JSNetWork : NSObject


+(JSNetWork *)shareInstance;

-(BOOL)isConnectNetWork;

-(NSDictionary *)PostBody:(NSDictionary *)postBody;


@end

