//
//  JSNetWork+Upload.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork+Upload.h"

@implementation JSNetWork (Upload)



-(void)upload:(NSString *)url postBody:(NSDictionary *)postBody  progress:(void (^)(NSProgress *downloadProgress,CGFloat currentProgress))currentProgress  completionHandler:(void(^)(BOOL isSuccess , id responseObject,NSError *error))completionHandler{
    
    //AFN3.0+基于封住HTPPSession的句柄
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
#pragma mark --------------支持Https--------------
    //AFN3.0+基于封住URLSession的句柄
    
    AFSecurityPolicy *securityPolicy=[[AFSecurityPolicy alloc] init];
    
    //AFN 默认情况下就是支持 HTTPS 访问的，但是如果用 HTTPS 的方式访问未受信任的网站便会报错
    securityPolicy.validatesDomainName = NO;
    session.securityPolicy=securityPolicy;
#pragma mark --------------支持Https--------------
    
    
    [session POST:url parameters:postBody constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       
        
//        UIImage *image =[UIImage imageNamed:@"moon"];
//        NSData *data = UIImagePNGRepresentation(image);
//        // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
//        // 要解决此问题，
//        // 可以在上传时使用当前的系统事件作为文件名
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        // 设置时间格式
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *str = [formatter stringFromDate:[NSDate date]];
//        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
//        
//        //上传
//        /*
//         此方法参数
//         1. 要上传的[二进制数据]
//         2. 对应网站上[upload.php中]处理文件的[字段"file"]
//         3. 要保存在服务器上的[文件名]
//         4. 上传文件的[mimeType]
//         */
//        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            
            CGFloat progress=1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
            currentProgress(uploadProgress,progress);
        });
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        completionHandler(YES,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
         completionHandler(NO,nil,error);
        
        
    }];
    
    
}




@end
