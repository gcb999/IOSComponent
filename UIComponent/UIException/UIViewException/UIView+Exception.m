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

    
     [self exchangeOriginalMethod:[UIView methodOfSelector:@selector(addSubview:)] withNewMethod:[UIView methodOfSelector:@selector(safe_addSubview:)]];
    
    
}

+ (void)exchangeOriginalMethod:(Method)originalMethod withNewMethod:(Method)newMethod
{
    method_exchangeImplementations(originalMethod, newMethod);
}


+ (Method)methodOfSelector:(SEL)selector
{
    return class_getInstanceMethod(NSClassFromString(@"UIView"),selector);
}

- (void)safe_addSubview:(UIView *)view
{
    if ( view && [view isKindOfClass:[UIView class]] && self!=view) {
        [self safe_addSubview:view];
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
