//
//  UIFont+Extend.h
//  Wifi
//
//  Created by muxi on 14/12/1.
//  Copyright (c) 2014年 muxi. All rights reserved.
//  字体扩展
//
//  注：本类的主要目的是为了引入常用的web字体
//
//
//
#import <UIKit/UIKit.h>



/*
 大小屏字体自动切换有的应用希望有一个好的用户体验会在不同的屏幕上适配不同大小字体，这时就可以使用以下的宏定义来实现。但是如果应用中字体大小不能做到全局统一，就不要使用以下的宏定义来实现字体大小适配。这个就看你所开发的具体情况了
 
 */

#define IS_SmallScreen (IS_IPHONE5 || IS_IPHONE4)

#define MaxFontSize    18
#define LagerFontSize  16
#define BigFontSize    14
#define NormalFontSize  12
#define SmallFontSize  10


//字体和字体大小
#define KFONT_NAME @"HelveticaNeue-Light"
//#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

#define  IS_SystemFont 1


#define KMaxFontSize    (IS_SystemFont==1)?[UIFont systemFontOfSize:MaxFontSize]:[UIFont fontWithName:KFONT_NAME size:MaxFontSize]
#define KLagerFontSize  (IS_SystemFont==1)?[UIFont systemFontOfSize:LagerFontSize]:[UIFont fontWithName:KFONT_NAME size:LagerFontSize]
#define KBigFontSize    (IS_SystemFont==1)?[UIFont systemFontOfSize:BigFontSize]:[UIFont fontWithName:KFONT_NAME size:BigFontSize]
#define KNormalFontSize (IS_SystemFont==1)?[UIFont systemFontOfSize:NormalFontSize]:[UIFont fontWithName:KFONT_NAME size:NormalFontSize]
#define KSmallFontSize  (IS_SystemFont==1)?[UIFont systemFontOfSize:SmallFontSize]:[UIFont fontWithName:KFONT_NAME size:SmallFontSize]






@interface UIFont (Extend)

/**
 *  打印并显示所有字体
 */
+(void)showAllFonts;


/**
 *  宋体(字体缺失)
 */
+(UIFont *)songTypefaceFontOfSize:(CGFloat)size;





/**
 *  微软雅黑：正常字体
 */
+(UIFont *)microsoftYaHeiFontOfSize:(CGFloat)size;


/**
 *  微软雅黑：加粗字体(字体缺失)
 */
+(UIFont *)boldMicrosoftYaHeiFontOfSize:(CGFloat)size;


/**
 *  DroidSansFallback
 */
+(UIFont *)customFontNamedDroidSansFallbackWithFontOfSize:(CGFloat)size;

@end
