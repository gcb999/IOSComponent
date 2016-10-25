//
//  NSMutableArray+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSMutableArray+Exception.h"
#import "NSObject+Exception.h"


@implementation NSMutableArray (Exception)




+(void)load{
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
    Class class=NSClassFromString(CoreExceptionArrayM);

 #pragma mark - 对象方法区
    //1.数组越界:无法处理

    //2.添加空对象
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(my_addObject:) originalMethodSelector:@selector(addObject:)];
    
    //3.添加空数组
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(my_addObjectsFromArray:) originalMethodSelector:@selector(addObjectsFromArray:)];
    
    
    //4.(setObject:atIndex: 设置空处理)
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(my_setObject:atIndex:) originalMethodSelector:@selector(setObject:atIndex:)];
    
    
    //5.(insertObject:atIndex: 插入空处理)
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(my_insertObject:atIndex:) originalMethodSelector:@selector(insertObject:atIndex:)];
    
    });
    
}




#pragma mark  -对象方法区


#pragma mark  -addObjectsFromArray
-(void)my_addObjectsFromArray:(NSArray *)otherArray{
    
    //不能添加空
    if(otherArray==nil && self.count!=0){
        
        return;
    }
    
    [self my_addObjectsFromArray:otherArray];
}



#pragma mark  处理添加空对象的异常
-(void)myAddNoExceptionObject:(id)anObject{
    
    if(anObject==nil){
        
        NSLog(@"Warinning:可变数组添加空对象。添加的对象为：%@，\n当前数组为：%@",anObject,self);
        @try {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        return;
    }
    
    [self myAddNoExceptionObject:anObject];
}



- (void)na_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject)
    {
        NSLog(@"数组insertObject 为空");
        @try {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        return;
        
    }
    [self na_insertObject:anObject atIndex:index];
}

- (void)na_setObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject)
    {
        NSLog(@"数组insertObject 为空");
        @try {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        return;
        
    }
    [self na_setObject:anObject atIndex:index];
}






@end
