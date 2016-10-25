//
//  HSError.h
//  DressLink
//
//  Created by gcb999 on 15/8/6.
//  Copyright (c) 2015年 com.sailvan.technology. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,  ErrorStatus) {
    
   
    ErrorStatus_Error,//网络请求失败
    ErrorStatus_DateError,//网络请求成功，数据错误
    ErrorState_SessionExpire,//网络请求成功，session过期
    ErrorState_notWork,//没有联网
};



@interface JSError : NSObject

//错误状态
@property(nonatomic,assign) ErrorStatus errorState;

//错误信息
@property(nonatomic,copy)NSString *errorMessage;
@end
