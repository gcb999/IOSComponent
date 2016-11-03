//
//  DLNetWoring+POST.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/22.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork+POST.h"


@implementation JSNetWork (POST)

#pragma mark -获取Post请求体

-(NSDictionary *)PostBody:(NSDictionary *)postBody{
    //Session
    NSString *session= [JSUserSingletonModel share].session;
    if (!IS_NSString(session)) session=@"";
  
  
    
    //country code
    NSString *country_code= [JSUserSingletonModel share].countryCode;
      if (!IS_NSString(country_code)) country_code=@"";
    
    
    // lng
    NSString *lng= [JSUserSingletonModel share].language;
    if (!IS_NSString(lng)) lng=@"";
    
   
    
    //current
    NSString *currency= [JSUserSingletonModel share].currency;
    if (!IS_NSString(currency)) currency=@"";
    

    //toke
    NSString *toke= [JSUserSingletonModel share].token;
    if (!IS_NSString(toke)) toke=@"";
    

    
    
    
    NSMutableDictionary *m_BodyDic=[NSMutableDictionary dictionaryWithDictionary:postBody];
    [m_BodyDic addEntriesFromDictionary:@{@"app_identify_key":toke,
                                          @"currency":currency,
                                          @"country_code":country_code,
                                          @"lang":lng,
                                          
                                          }];
    
     if (IS_NSString(session))  {
        [m_BodyDic addEntriesFromDictionary:@{@"session":session}];
        
    }
//     else{
//           [m_BodyDic addEntriesFromDictionary:@{@"session":@""}];
//     }
    
    
//    NSMutableDictionary *resultdic=[NSMutableDictionary dictionaryWithDictionary:postBody];
//
//    
//    //POST
//    [resultdic addEntriesFromDictionary:@{@"post":m_BodyDic}];
    
    
//    NSLog(@"___post请求体 %@",m_BodyDic);


    return m_BodyDic;
}

#pragma mark -错误信息
-(void)buglyError:(NSString *)absoluteUrl postBody:(NSDictionary *)postBody errorMessage:(NSString *)errorMessage currentView:(UIView *)actionView{
    
    @try {
        
        
        NSString *error=@"";
        if (actionView) {
            error= [NSString stringWithFormat:@"版本号=%@,URL=%@,post请求体=%@ 错误=%@,错误原因=%@,程序中对应控制器=%@",@"",absoluteUrl,[postBody mj_JSONString],@"服务端返回数错误",errorMessage,[actionView viewController]];
            
        }
        else{
            error= [NSString stringWithFormat:@"版本号=%@,URL=%@,post请求体=%@,错误%@,错误原因=%@",@"",absoluteUrl,[postBody mj_JSONString],@"服务端返回数据成功错误",errorMessage];
        }
        
//        [[JSBugly shareInstance] exceptionName:@"POST请求错误" reason:error];
        
        
    } @catch (NSException *exception) {
   
        
    } @finally {
        
    }
    
}



#pragma mark -发送请求

-(void)request:(NSString *)url postBody:(NSDictionary *)postBody activityView:(UIView *)ActivityView  result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    
    
    if (url==nil) {
        url=DLURL;
    }
    else{
        url= [NSString stringWithFormat:@"%@?%@",DLURL,url];
    }

   
    if (ActivityView) {
       
            
          [MBProgressHUD showMessag:JSLocalizedString(@"loading", nil) toView:ActivityView];
        
        
    }
    
    if (![self isConnectNetWork]) {//判断是否联网
        if(ActivityView){
        [MBProgressHUD hideHUDForView:ActivityView animated:YES];
        }
        JSError *error=[[JSError alloc] init];
        error.errorState=ErrorState_notWork;
        error.errorMessage=@"没有连接网络";
        result(NO,nil,error);
        return;
    }
    
    
    //获取请求体
    NSDictionary *postbodyDic =[self PostBody:postBody];

     AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
#pragma mark --------------支持Https--------------
    //AFN3.0+基于封住URLSession的句柄
    
    AFSecurityPolicy *securityPolicy=[[AFSecurityPolicy alloc] init];
    
    //AFN 默认情况下就是支持 HTTPS 访问的，但是如果用 HTTPS 的方式访问未受信任的网站便会报错
    securityPolicy.validatesDomainName = NO;
    session.securityPolicy=securityPolicy;
#pragma mark --------------支持Https--------------
    session.requestSerializer.timeoutInterval=60;
    session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    [session POST:url parameters:postbodyDic progress:^(NSProgress * _Nonnull uploadProgress) {
        

        
       
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
        if (ActivityView) {

            
                [MBProgressHUD hideHUDForView:ActivityView animated:YES];

            
        }
        
      
        
        
        NSDictionary *rootDic=(NSDictionary *)responseObject;
        NSLog(@"the reg response is %@",rootDic);
        
        
    
            if ([rootDic[@"result"] isEqualToString:@"success"]) {
                
                [self saveData:rootDic];
                
               
                
                
                result(YES,rootDic,nil);
            }
            else
            {
                
                
                @try {
                    
                    JSError *error=[[JSError alloc] init];
                    NSString *errcode=rootDic[@"errcode"];
                    
                    if ([errcode isKindOfClass:[NSNull class]]) {
                        errcode=@"";
                    }
                    
                    
                    if ([errcode isEqualToString:@"0x1009"]) {//过期
                        
                        error.errorState=ErrorState_SessionExpire;
                    }
                    else{
                        
                        error.errorState=ErrorStatus_DateError;
                    }
                    //Bugly
                    
                    NSString *errorMessage=rootDic[@"errmsg"];
                    if (errorMessage==nil || [errorMessage isKindOfClass:[NSNull class]]|| !IS_NSString(errorMessage)) {
                        errorMessage=@"";
                    }
                    error.errorMessage=errorMessage;
                    [self buglyError:url postBody:postbodyDic errorMessage:errorMessage currentView:ActivityView];
                    
                    result(NO,rootDic,error);
                    
                    
                } @catch (NSException *exception) {
                    
                } @finally {
                    
                }
                
     
            }

        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:ActivityView animated:YES];
        JSError *error1=[[JSError alloc] init];
        error1.errorState=ErrorStatus_Error;
        error1.errorMessage=error.localizedDescription;
        result(NO,nil,error1);
        [self buglyError:url postBody:postbodyDic errorMessage:error.localizedDescription currentView:ActivityView];
     
    }];
    

}





#pragma mark ---------------------------AFNetWork  POST Method---------------------------


-(void)post:(NSString *)url postBody:(NSDictionary *)postBody result:(void (^)(BOOL, NSDictionary *, JSError *))result{

    [self request:url postBody:postBody activityView:nil result:result];
}

-(void)post:(NSString *)url postBody:(NSDictionary *)postBody ActivityView:(UIView *)activityView result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url postBody:postBody activityView:activityView result:result];
}

#pragma mark -保持数据

-(void)saveData:(NSDictionary *)dic{
    
    if (IS_NSDictionary(dic)) {

        
        if (IS_NSString(dic[@"session"])) {
            [JSUserSingletonModel share].session=dic[@"session"];
        }
//        else{
//             [JSUserSingletonModel share].session=@"";
//        }
        
        if (IS_NSString(dic[@"country_code"])) {
            [JSUserSingletonModel share].countryCode=dic[@"country_code"];
        }
        if (IS_NSString(dic[@"country_name"])) {
            [JSUserSingletonModel share].country_name=dic[@"country_name"];
        }
        if (IS_NSString(dic[@"country_code_id"])) {
            [JSUserSingletonModel share].country_code_id=dic[@"country_code_id"];
        }
        
        if (IS_NSString(dic[@"lang"])) {
            [JSUserSingletonModel share].language=dic[@"lang"];
        }
        
        if (IS_NSString(dic[@"currency"])) {
            [JSUserSingletonModel share].currency=dic[@"currency"];
        }
        //购物车
        NSString *total_qty=dic[@"total_qty"];
        if (IS_NSString(total_qty)) {
            [JSUserSingletonModel share].carQty=total_qty;
        }
        NSString *customer_id=dic[@"customer_id"];
        if (IS_NSString(customer_id)) {
            [JSUserSingletonModel share].userId=customer_id;
        }
        
        //是否有地址
        NSString *address_symbol=dic[@"address_symbol"];
        if (IS_NSString(address_symbol)) {
            [JSUserSingletonModel share].address_symbol=address_symbol;
        }
        
        NSString *state_version=dic[@"state_version"];
        if (IS_NSString(state_version)) {
            [JSUserSingletonModel share].state_version=state_version;
        }
        NSString *open_sign=dic[@"open_sign"];
        @try {
            
          
            if (IS_NSString(open_sign)) {
                [JSUserSingletonModel share].registerFlag=open_sign;
            }
            else   if (open_sign && [open_sign isKindOfClass:[NSNumber class]]) {
                NSNumber* sigin=(NSNumber *)open_sign;
                open_sign=[NSString stringWithFormat:@"%d",[sigin boolValue]];
                [JSUserSingletonModel share].registerFlag=open_sign;
            }
            else{
                [JSUserSingletonModel share].registerFlag=@"1";
            }
            
            
        } @catch (NSException *exception) {
            
            [JSUserSingletonModel share].registerFlag=@"1";
            
        } @finally {
            
        }
    

    }
    
    
}


@end
