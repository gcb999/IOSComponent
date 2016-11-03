//
//  PaymentHeader.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#ifndef PaymentHeader_h
#define PaymentHeader_h



#define PAYPALENVIRON_TYPE 0

#if PAYPALENVIRON_TYPE ==0

#define PAYPALENVIRONMENT PayPalEnvironmentSandbox//测试

#elif PAYPALENVIRON_TYPE==1

#define PAYPALENVIRONMENT PayPalEnvironmentProduction//正式

#else

#define PAYPALENVIRONMENT PayPalEnvironmentNoNetwork//无网

#endif


#endif /* PaymentHeader_h */
