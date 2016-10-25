//
//  NSMutableDictionary+Exception.m
//  DressLink
//
//  Created by gcb999 on 16/8/23.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "NSMutableDictionary+Exception.h"
#import "NSObject+Exception.h"

@implementation NSMutableDictionary (Exception)


+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
    Class class=NSClassFromString(CoreExceptionDictionaryM);
    
 #pragma mark -  对象方法区
    //1.数组越界:无法处理
    
    //2.添加空对象
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(na_setObject:forKey:) originalMethodSelector:@selector(setObject:forKey:)];
    
    });
}





#pragma mark - setObject:forKey: 空对象的异常
- (void)na_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject) {
        [self na_setObject:anObject forKey:aKey];
    }
    else
    {
        [self removeObjectForKey:aKey];
    }
}
@end
