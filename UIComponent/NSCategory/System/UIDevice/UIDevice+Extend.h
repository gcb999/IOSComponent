//
//  UIDevice+Extend.h
//  CoreCategory
//
//  Created by 成林 on 15/5/6.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import <UIKit/UIKit.h>

//ios系统版本
#define ios8x [[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f
#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
#define ios6x [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f
#define iosNot6x [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f



#define IS_IPHONE4 ([UIScreen mainScreen].bounds.size.height == 480.f)

#define IS_IPHONE5 ([UIScreen mainScreen].bounds.size.height == 568.f)

#define IS_IPHONE6 ([UIScreen mainScreen].bounds.size.height == 667.f)

#define IS_IPHONE6_PLUS ([UIScreen mainScreen].bounds.size.height == 736.f)

#define IPHONE6Height  667.f
#define IPHONE6Width  375.f

//判断iphone6+

#define iPhone6X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//IPHONE 高度 和宽度

#define IPHONScreenWidth    [[UIScreen mainScreen] bounds].size.width

#define IPHONScreenHeight    [[UIScreen mainScreen] bounds].size.height


//获取设备系统版本 7.0
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0 ?YES:NO

#define KIOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define KCURRENT_SYSTEM_VERSION ([[UIDevice currentDevice] systemVersion])


// App
#define KAPP_VERSION      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//获取当前语言
#define KCURRENT_LANGUAGES ([[NSLocale preferredLanguages] objectAtIndex:0])


#define Device_Simulator   @"Simulator"
#define Device_iPod1   @"iPod1"
#define Device_iPod2   @"iPod2"
#define Device_iPod3   @"iPod3"
#define Device_iPod4   @"iPod4"
#define Device_iPod5   @"iPod5"
#define Device_iPad2   @"iPad2"
#define Device_iPad3   @"iPad3"
#define Device_iPad4   @"iPad4"
#define Device_iPhone4   @"iPhone 4"
#define Device_iPhone4S   @"iPhone 4S"
#define Device_iPhone5   @"iPhone 5"
#define Device_iPhone5S   @"iPhone 5S"
#define Device_iPhone5C   @"iPhone 5C"
#define Device_iPadMini1   @"iPad Mini 1"
#define Device_iPadMini2   @"iPad Mini 2"
#define Device_iPadMini3   @"iPad Mini 3"
#define Device_iPadAir1   @"iPad Air 1"
#define Device_iPadAir2   @"iPad Mini 3"
#define Device_iPhone6   @"iPhone 6"
#define Device_iPhone6plus   @"iPhone 6 Plus"
#define Device_iPhone6S   @"iPhone 6S"
#define Device_iPhone6Splus   @"iPhone 6S Plus"
#define Device_Unrecognized   @"?unrecognized?"


@interface UIDevice (Extend)

+(NSString *)deviceModel;

@end
