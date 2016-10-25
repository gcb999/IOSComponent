//
//  MBProgressHUD+Add.m
//  TestFrame
//
//  Created by zy on 13-8-27.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)





+ (void)showError:(NSString *)error toView:(UIView *)view{
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.labelText = @"";
    
    hud.detailsLabelText=error;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"faile"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
//    hud.color = [UIColor blackColor];
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view{
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.labelText = success;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
  
    hud.mode = MBProgressHUDModeCustomView;
    //    hud.color = [UIColor blackColor];
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
}

#pragma mark 显示一些信息
//http://www.voidcn.com/blog/walden00/article/p-4568425.html
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view {
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.labelText = message;
       // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
    
 
    
    hud.mode = MBProgressHUDModeCustomView;

    UIImageView *imgview= [UIImageView imageViewImageName:CGRectMake(0, 0, 40, 40) gifName:@""];
    hud.customView=imgview;

    //1,设置背景框的透明度  默认0.8
//    hud.opacity = 0.8;
    
    //2,设置背景框的背景颜色和透明度， 设置背景颜色之后opacity属性的设置将会失效
//    hud.color = [UIColor colorWithWhite:0 alpha:0.8];
//    hud.color = [hud.color colorWithAlphaComponent:1];
//    
//    hud.color=[UIColor colorWithRed:200 green:200 blue:200 alpha:0.8];
    hud.color = KCOLOR_WHITE;
//
//    hud.labelText = message;
//    // 隐藏时候从父控件中移除
//    hud.removeFromSuperViewOnHide = YES;
//    
//    // YES代表需要蒙版效果
//    hud.dimBackground = YES;

//
//    //13,是否强制背景框宽高相等
//    hud.square = YES;
    
    return hud;
}


+ (void)showText:(NSString *)error toView:(UIView *)view{
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.labelText = error;
    
//    hud.detailsLabelText=error;
    // 设置图片
//    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"faile"]];
    // 再设置模式
    hud.mode = MBProgressHUDModeText;
    
    //    hud.color = [UIColor blackColor];
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // YES代表需要蒙版效果
    hud.dimBackground = NO;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:1];
}




@end
