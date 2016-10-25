//
//  MBProgressHUD+Add.h
//  TestFrame
//
//  Created by zy on 13-8-27.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)

+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showText:(NSString *)error toView:(UIView *)view;

@end
