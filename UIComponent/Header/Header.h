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






#endif

