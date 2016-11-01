//
//  JSFmdb.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSFmdb.h"

@implementation JSFmdb


#pragma mark -单例类
static JSFmdb * _instance = nil;

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
    return [JSFmdb shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSFmdb shareInstance] ;
}


@end
