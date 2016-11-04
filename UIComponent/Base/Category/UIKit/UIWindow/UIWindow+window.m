//
//  UIWindow+window.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "UIWindow+window.h"

@implementation UIWindow (window)


#pragma mark  主window
+(UIWindow *)window{
    
    id<UIApplicationDelegate> delegate = ((id<UIApplicationDelegate>)[[UIApplication sharedApplication] delegate]);
    UIWindow *window = delegate.window;
    
    //    //显示状态栏
    //    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    //
    //    //状态栏样式
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //
    //设置背景色
    window.backgroundColor=[UIColor whiteColor];
    
    
    
    //返回
    return window;
}

@end
