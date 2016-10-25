//
//  UIView+Exception.m
//  DressLink
//
//  Created by gcb999 on 16/8/22.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "UIView+Exception.h"
#import "NSObject+Exception.h"

@implementation UIView (Exception)

+(void)load{

    

    //使用dispatch_once来执行方法交换，这样可以保证只运行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        
        [self swizzleInstanceMethodInClass:selfClass newMethodSelector:@selector(addSubview:) originalMethodSelector:@selector(js_addSubview:)];
        
        
        
    });
    
    
}



- (void)js_addSubview:(UIView *)view
{
    if ( view && [view isKindOfClass:[UIView class]] && self!=view) {
        [self js_addSubview:view];
    }
    else{
        @try {
            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
            
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
 
        
    }
}






@end
