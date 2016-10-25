//
//  UIButton+Exception.m
//  DressLink
//
//  Created by gcb999 on 16/8/23.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "UIButton+Exception.h"
#import "NSObject+Exception.h"

@implementation UIButton (Exception)

+ (void)load {
    
    //使用dispatch_once来执行方法交换，这样可以保证只运行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        
        [self swizzleInstanceMethodInClass:selfClass newMethodSelector:@selector(sendAction:to:forEvent:) originalMethodSelector:@selector(js_sendAction:to:forEvent:)];
        

        
    });
}


#pragma mark -按钮点击事件


- (void)js_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {

    //统计(按钮）
    /*
     
     1: 按钮对应的控制器
     
     2: 当前某个视图+某控件+action名称+target名称
     
     */
    NSLog(@"---aa");
    
    
    [self js_sendAction:action to:target forEvent:event];
}


@end
