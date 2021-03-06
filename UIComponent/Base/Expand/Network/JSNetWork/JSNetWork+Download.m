//
//  JSNetWork+Download.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork+Download.h"

@implementation JSNetWork (Download)


- (NSURLSessionDownloadTask *)download:(NSString *)url progress:(void (^)(NSProgress *downloadProgress,CGFloat currentProgress)) currentProgress completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler{
    
    //远程地址
    NSURL *URL = [NSURL URLWithString:url];
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    
#pragma mark --------------支持Https--------------
    //AFN3.0+基于封住URLSession的句柄
    AFURLSessionManager *session = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    AFSecurityPolicy *securityPolicy=[[AFSecurityPolicy alloc] init];
    
    //AFN 默认情况下就是支持 HTTPS 访问的，但是如果用 HTTPS 的方式访问未受信任的网站便会报错
    securityPolicy.validatesDomainName = NO;
    session.securityPolicy=securityPolicy;
#pragma mark --------------支持Https--------------
    
    
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    //下载Task操作
    NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            CGFloat progress=1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
            currentProgress(downloadProgress,progress);
        });
        
   
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {//下载到指定位置
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
//        return destination(targetPath,response);
                NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
                NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
                return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //设置下载完成操作
        // filePath就是你下载文件的位置，你可以解压，也可以直接拿来使用
        
        dispatch_async(dispatch_get_main_queue(), ^{
              completionHandler(response,filePath,error);
        });
        
     
        //        NSString *imgFilePath = [filePath path];// 将NSURL转成NSString
        //        UIImage *img = [UIImage imageWithContentsOfFile:imgFilePath];
        //        self.imageView.image = img;
        
    }];
    
    // 3、执行任务
    [downloadTask resume];
    
    return  downloadTask;
}







@end
