//
//  JSUserSingletonModel.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSUserSingletonModel.h"

@implementation JSUserSingletonModel

static JSUserSingletonModel * _instance = nil;

+(instancetype) share
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}




-(NSString *)email{
    
    return USER_DEFAULT_ValueForKey(@"email");
}

-(void)setEmail:(NSString *)email{
    USER_DEFAULT_SetObject(@"email", email);
    
}

-(NSString *)userId{
    
    return USER_DEFAULT_ValueForKey(@"customer_id");
}

-(void)setUserId:(NSString *)userId{
    USER_DEFAULT_SetObject(@"customer_id", userId);
}

-(BOOL)isLogin{
    BOOL flag=NO;
    @try {
       
        if (IS_NSString(self.userId) && [self.userId integerValue]>0) {
            flag=YES;
        }
        else{
            
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
   
    return flag;
}


-(NSString *)userName{
    
    return USER_DEFAULT_ValueForKey(@"userName");
}

-(void)setUserName:(NSString *)userName{
    USER_DEFAULT_SetObject(@"userName", userName);
}




-(NSString *)token{
    
    return USER_DEFAULT_ValueForKey(@"token");
}

-(void)setToken:(NSString *)token{
    USER_DEFAULT_SetObject(@"token", token);
}

-(NSString *)session{
    
    return USER_DEFAULT_ValueForKey(@"session");
}

-(void)setSession:(NSString *)session{
    USER_DEFAULT_SetObject(@"session", session);
}

-(NSString *)currency{
    
    return USER_DEFAULT_ValueForKey(@"currency");
}

-(void)setCurrency:(NSString *)currency{
    USER_DEFAULT_SetObject(@"currency", currency);
}

-(NSString *)countryCode{
    
    return USER_DEFAULT_ValueForKey(@"countryCode");
}

-(void)setCountryCode:(NSString *)countryCode{
    USER_DEFAULT_SetObject(@"countryCode", countryCode);
}


-(NSString *)country_code_id{
    
    return USER_DEFAULT_ValueForKey(@"country_code_id");
}

-(void)setCountry_code_id:(NSString *)country_code_id{
    USER_DEFAULT_SetObject(@"country_code_id", country_code_id);
}


-(NSString *)country_name{
    
    return USER_DEFAULT_ValueForKey(@"country_name");
}

-(void)setCountry_name:(NSString *)country_name{
    USER_DEFAULT_SetObject(@"country_name", country_name);
}




-(NSString *)language{
    
    return USER_DEFAULT_ValueForKey(@"localLanguage");
}

-(void)setLanguage:(NSString *)language{
    USER_DEFAULT_SetObject(@"localLanguage", language);
}

-(NSString *)carQty{
    
    return USER_DEFAULT_ValueForKey(@"carQty");
}

-(void)setCarQty:(NSString *)carQty{
    USER_DEFAULT_SetObject(@"carQty", carQty);
}



-(NSString *)address_symbol{
    
    return USER_DEFAULT_ValueForKey(@"address_symbol");
}

-(void)setAddress_symbol:(NSString *)address_symbol{
    USER_DEFAULT_SetObject(@"address_symbol", address_symbol);
}


-(NSString *)state_version{
    
    return USER_DEFAULT_ValueForKey(@"new_state_version");
}

-(void)setState_version:(NSString *)state_version{
    USER_DEFAULT_SetObject(@"new_state_version", state_version);
}



-(NSString *)registerFlag{
    
    return USER_DEFAULT_ValueForKey(@"registerFlag");
}

-(void)setRegisterFlag:(NSString *)registerFlag{
        USER_DEFAULT_SetObject(@"registerFlag", registerFlag);
}

-(BOOL)isRegisterFlag{
    BOOL flag=NO;
    @try {
        
        if (IS_NSString(self.registerFlag) && ![self.registerFlag isEqualToString:@"0"]) {
            flag=YES;
        }
        else{
            
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    return flag;
}


@end
