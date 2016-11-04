//
//  NSObject+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSObject+Exception.h"
#import <objc/runtime.h>

typedef enum{
    
    SwizzleTypeClass=0,                                             //类方法
    
    SwizzleTypeInstance,                                            //对象方法
    
}SwizzleType;


@implementation NSObject (Exception)


#pragma mark -实例方法
+(void)swizzleInstanceMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector{
    [self swizzleWithType:SwizzleTypeInstance InClass:class newMethodSelector:newMethodSelector originalMethodSelector:originalMethodSelector];
}


#pragma mark - 类方法

+(void)swizzleClassMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector{
    [self swizzleWithType:SwizzleTypeClass InClass:class newMethodSelector:newMethodSelector originalMethodSelector:originalMethodSelector];
}


+(void)swizzleWithType:(SwizzleType)type InClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector{
    
    Method newMethod=NULL;
    
    Method originalMethod=NULL;
    
    
#pragma mark - 类方法互换
    if(SwizzleTypeClass==type){
        
        newMethod=class_getClassMethod(class, newMethodSelector);
        
        originalMethod=class_getClassMethod(class, originalMethodSelector);
        
         if(originalMethod && newMethod) {//必须两个Method都要拿到
             
                method_exchangeImplementations(originalMethod,newMethod);
         }
        

        
    }
#pragma mark - 实例方法互换
    else if(SwizzleTypeInstance==type){
        
      
        
        
         //1:源方法的SEL和Method
        newMethod=class_getInstanceMethod(class, newMethodSelector);
        
         //2:交换方法的SEL和Method
        originalMethod=class_getInstanceMethod(class, originalMethodSelector);
        
        if(originalMethod && newMethod) {//3;必须两个Method都要拿到
          
            //4：先尝试給源方法添加实现，这里是为了避免源方法没有实现的情况
            BOOL addSucc = class_addMethod(class, originalMethodSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
            if (addSucc) {
               
                //5：添加成功：将源方法的实现替换到交换方法的实现
                class_replaceMethod(class, newMethodSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            }else {
                
                //6：添加失败：说明源方法已经有实现，直接将两个方法的实现交换即可
                method_exchangeImplementations(originalMethod,newMethod);
            }

            
        }
        
        
        
    }
    

}

@end
