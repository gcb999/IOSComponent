//
//  NSArray+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSArray+Exception.h"
#import "NSObject+Exception.h"


@implementation NSArray (Exception)



+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    
    Class class=NSClassFromString(CoreExceptionArray);
    
    
#pragma mark - 类方法区
    //使用空数组初始化
    [self swizzleClassMethodInClass:class newMethodSelector:@selector(js_arrayWithArray:) originalMethodSelector:@selector(arrayWithArray:)];
    
    
 
    
 #pragma mark - 对象方法区
    //数组越界 （实例方法）
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(js_objectAtIndex:) originalMethodSelector:@selector(objectAtIndex:)];
    
   
    });

    
}




#pragma mark - 类方法区
#pragma mark -  arrayWithArray 初始化错误
+(instancetype)js_arrayWithArray:(NSArray *)array{
    
    if(![array isKindOfClass:[NSArray class]]){
        
        if(array!=nil){
           NSLog(@"Warinning:使用数组的类方法初始化的时候传入的array不是真正的数组:%@（真正的类型为：%@），目标数组的类型为：%@。",array,NSStringFromClass([array class]),NSStringFromClass(self));
            @try {
                NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
                
                
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
        }

        return nil;
    }

    return [self js_arrayWithArray:array];
}







#pragma mark  -对象方法区
#pragma mark  处理数组越界的错误
-(id)js_objectAtIndex:(NSUInteger)index{

    NSUInteger count=self.count;
    
    if(index>=count){
        
        NSLog(@"Warinning:数组出现越界。数组长度为：%i,请求的长度为：%i，\n当前数组为：%@",count,index,self);
        @try {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        return nil;
    }
    
    return [self js_objectAtIndex:index];
}




@end
