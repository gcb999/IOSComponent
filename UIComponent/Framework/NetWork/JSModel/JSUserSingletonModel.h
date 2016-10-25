//
//  JSUserSingletonModel.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSUserSingletonModel : NSObject

+ (JSUserSingletonModel*)share;


//用户Email
@property(nonatomic,copy)NSString *email;


//用户名
@property(nonatomic,copy)NSString *userName;


//用户ID
@property(nonatomic,copy)NSString *userId;

//是否登录
@property (nonatomic , assign) BOOL isLogin;


//TOKE
@property(nonatomic,copy)NSString *token;

//sesion

@property(nonatomic,copy)NSString *session;


//国家编码
@property(nonatomic,copy)NSString *countryCode;

@property(nonatomic,copy)NSString *country_name;

@property(nonatomic,copy)NSString *country_code_id;

//货币
@property(nonatomic,copy)NSString *currency;


//语言
@property(nonatomic,copy)NSString *language;

//购物车数量
@property(nonatomic,copy)NSString *carQty;

//是否有购物车
@property (nonatomic , copy) NSString * address_symbol;

//版本号
@property (nonatomic , copy) NSString * state_version;

//是否显示注册
@property (nonatomic , copy) NSString * registerFlag;

//是否显示注册
@property (nonatomic , assign,readonly) BOOL isRegisterFlag;

@end
