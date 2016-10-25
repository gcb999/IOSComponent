//
//  NSObject+Exception.h
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreExceptionHeader.h"

@interface NSObject (Exception)

#pragma mark - 实例方法

+(void)swizzleInstanceMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector;

#pragma mark - 类方法

+(void)swizzleClassMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector;

@end
