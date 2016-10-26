//
//  Header.h
//  ProgramDemo
//
//  Created by zy on 13-11-18.
//  Copyright (c) 2013年 zy. All rights reserved.
//

#ifndef ProgramDemo_Header_h
#define ProgramDemo_Header_h








#define PAYPALENVIRON_TYPE 0

#if PAYPALENVIRON_TYPE ==0

#define PAYPALENVIRONMENT PayPalEnvironmentSandbox//测试

#elif PAYPALENVIRON_TYPE==1

#define PAYPALENVIRONMENT PayPalEnvironmentProduction//正式

#else

#define PAYPALENVIRONMENT PayPalEnvironmentNoNetwork//无网

#endif




//宏头文件
#import "MacroHeader.h"



#define DLURL @"http://app.dresslink.com/app.php"


#import "NSObjectHeader.h"
#import "UImageViewHeader.h"
#import "NSStringHeader.h"

#import "MBProgressHUD+Add.h"
#import "UIWindow+window.h"
#import "UIView+Coordinates.h"
#import "UIView+AnimationProperty.h"

//system
#import "UIFont+Extend.h"
#import "UIDevice+Extend.h"
#import "UIColor+Hex.h"

//
//MJ 模型编码
#import "MJExtension.h"


//网络
#import "JSNetWorkHeader.h"


//列表
#import "TableViewHeader.h"


#define ALLLANGUAGEARRY [[NSMutableArray alloc]initWithObjects:@"en",@"ru",@"fr",@"es",@"de",@"cs",@"pl",@"pt", nil]

//#define CURLANGUAGE [[NSUserDefaults standardUserDefaults] objectForKey:@"localLanguage"]

#define CURLANGUAGE   [[[NSUserDefaults standardUserDefaults] objectForKey:@"localLanguage"] isEqualToString:@"cz"]?@"cs":[[NSUserDefaults standardUserDefaults] objectForKey:@"localLanguage"]

#define JSLocalizedString(key, comment)     [[NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:CURLANGUAGE ofType:@"lproj"]]localizedStringForKey:key value:nil table:@"language"]==nil?key:[[NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:CURLANGUAGE ofType:@"lproj"]]localizedStringForKey:key value:nil table:@"language"]






#endif

