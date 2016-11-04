//
//  JSRefresh.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSRefresh.h"

@implementation JSRefresh





#pragma mark -单例类
static JSRefresh * _instance = nil;

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
    return [JSRefresh shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSRefresh shareInstance] ;
}







@end
