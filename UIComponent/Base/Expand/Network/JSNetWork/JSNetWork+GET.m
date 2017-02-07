//
//  DLNetWoring+GET.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/22.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork+GET.h"

@implementation JSNetWork (GET)



#pragma mark -获取完整的URL

-(NSString *)AbsoluteUrl:(NSString *)url{
    
    //Session
    NSString *session= [JSUserSingletonModel share].session;
    if (!IS_NSString(session)) session=@"";
    
    
    
    //country code
    NSString *country_code= [JSUserSingletonModel share].countryCode;
    if (!IS_NSString(country_code)) country_code=@"EN";
    
    // lng
    NSString *lng= [JSUserSingletonModel share].language;
    if (!IS_NSString(lng)) lng=@"en";
    
    
    
    //current
    NSString *currency= [JSUserSingletonModel share].currency;
    if (!IS_NSString(currency)) currency=@"USD";
    
    
    //toke
    NSString *toke= [JSUserSingletonModel share].token;
    if (!IS_NSString(toke)) toke=@"";
    
//http://m-tmpbranch.app.cndirect.com/app.php?s=/product-homePage.html&app_identify_key=0357256d-d065-44b5-9ecb-d3186cca9399/lng/en/currency/USD/country_code/US


    url= [NSString stringWithFormat:@"%@?%@&app_identify_key=%@&lang=%@&currency=%@&country_code=%@",DLURL,url,toke,lng,currency,country_code];
    
    
    if (IS_NSString(session)) {
        url = [NSString stringWithFormat:@"%@&session=%@",url,session];
    }
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return url;
    
}



#pragma mark -错误信息
-(void)buglyError:(NSString *)absoluteUrl errorMessage:(NSString *)errorMessage currentView:(UIView *)actionView{
    
    @try {
        
        
        NSString *error=@"";
        if (actionView) {
            error= [NSString stringWithFormat:@"版本号=%@,URL=%@,错误=%@,错误原因=%@,程序中对应控制器=%@",@"",absoluteUrl,@"服务端返回数据错误",errorMessage,[actionView viewController]];
            
        }
        else{
            error= [NSString stringWithFormat:@"版本号=%@,URL=%@,错误%@,错误原因=%@",@"",absoluteUrl,@"服务端返回错误",errorMessage];
        }
        
//        [[JSBugly shareInstance] exceptionName:@"Get请求错误" reason:error];
        
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}



#pragma mark -发送请求

-(void)request:(NSString *)url activityView:(UIView *)ActivityView  result:(void (^)(BOOL, NSDictionary *, JSError *))result{

    
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
    
     NSString *absoluteUrl=@"";
    if ([url hasSuffix:@"http"]) {
        absoluteUrl=url;
    }
    else{
       absoluteUrl=url;
    }
    


    
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        session.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", @"text/javascript", nil];
    
#pragma mark --------------支持Https--------------
    //AFN3.0+基于封住URLSession的句柄
    
    AFSecurityPolicy *securityPolicy=[[AFSecurityPolicy alloc] init];
    
    //AFN 默认情况下就是支持 HTTPS 访问的，但是如果用 HTTPS 的方式访问未受信任的网站便会报错
    securityPolicy.validatesDomainName = NO;
    session.securityPolicy=securityPolicy;
#pragma mark --------------支持Https--------------
 
    session.requestSerializer.timeoutInterval = 30;
        absoluteUrl = [absoluteUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        [session GET:absoluteUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
//                   NSLog(@"------%f",1.0*downloadProgress.completedUnitCount/downloadProgress.totalUnitCount);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *rootDic=(NSDictionary *)responseObject;
            
            if (ActivityView) {
                [MBProgressHUD hideHUDForView:ActivityView animated:YES];
            }
            
           NSLog(@"Get请求Response=======\n%@",rootDic);
            
            
            if ([rootDic[@"result"] isEqualToString:@"success"]) {
                 [self saveData:rootDic];
                result(YES,rootDic,nil);
               
            }
            else
            {
                
                NSString *buglyStr=@"";
                
                JSError *error=[[JSError alloc] init];
                NSString *errcode=[self converToString:rootDic[@"errcode"]];
                if ([errcode isEqualToString:@"0x1009"]) {//过期
                    error.errorState=ErrorState_SessionExpire;
                }
                else{
                    error.errorState=ErrorStatus_DateError;
                }
                
                NSString *errorMessage=rootDic[@"errmsg"];
                if (errorMessage==nil || [errorMessage isKindOfClass:[NSNull class]]|| !IS_NSString(errorMessage)) {
                    errorMessage=@"";
                }
                error.errorMessage=errorMessage;
                [self buglyError:absoluteUrl errorMessage:errorMessage currentView:ActivityView];
                
                result(NO,rootDic,error);
            }
        
        
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (ActivityView) {
                [MBProgressHUD hideHUDForView:ActivityView animated:YES];
            }
            JSError *error1=[[JSError alloc] init];
            error1.errorState=ErrorStatus_Error;
            error1.errorMessage=error.localizedDescription;
            result(NO,nil,error1);
            //Bugly
            [self buglyError:absoluteUrl errorMessage:error.localizedDescription currentView:ActivityView];
     
        
        }];
    


}



-(void)get:(NSString *)url result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url activityView:nil result:result];
}

-(void)get:(NSString *)url ActivityView:(UIView *)activityView result:(void (^)(BOOL, NSDictionary *, JSError *))result{
    [self request:url activityView:activityView result:result];
}


#pragma mark -保持数据

-(void)saveData:(NSDictionary *)dic{
    
    if (IS_NSDictionary(dic)) {
        
        if (IS_NSString(dic[@"session"])) {
            [JSUserSingletonModel share].session=dic[@"session"];
        }
        
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
        if (IS_NSString(open_sign)) {
            [JSUserSingletonModel share].registerFlag=open_sign;
        }
      
        
        
    }
    
    
}


- (void)request:(NSString *)url progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
    destination:(NSURL * (^)(NSURL *targetPath, NSURLResponse *response))destination
completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler{
    
    //远程地址
    NSURL *URL = [NSURL URLWithString:url];
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //AFN3.0+基于封住URLSession的句柄
    AFURLSessionManager *session = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    //下载Task操作
   NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {

       
       downloadProgressBlock(downloadProgress);
        // @property int64_t totalUnitCount;     需要下载文件的总大小
        // @property int64_t completedUnitCount; 当前已经下载的大小
        
        // 给Progress添加监听 KVO
//        NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
//        // 回到主队列刷新UI
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // 设置进度条的百分比
//            
//            self.progressView.progress = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
//        });
       
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
       return destination(targetPath,response);
//        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//        NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
//        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //设置下载完成操作
        // filePath就是你下载文件的位置，你可以解压，也可以直接拿来使用
        completionHandler(response,filePath,error);
//        NSString *imgFilePath = [filePath path];// 将NSURL转成NSString
//        UIImage *img = [UIImage imageWithContentsOfFile:imgFilePath];
//        self.imageView.image = img;
        
    }];
}




@end
