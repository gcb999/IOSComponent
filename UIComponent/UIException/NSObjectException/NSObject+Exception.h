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

+(void)swizzleInstanceMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector;

+(void)swizzleClassMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector;

@end
