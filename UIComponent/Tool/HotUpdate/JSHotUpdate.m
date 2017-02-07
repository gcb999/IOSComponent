//
//  JSHotUpdate.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSHotUpdate.h"
#import "JSNetWork.h"
#import <SSZipArchive.h>

@implementation JSHotUpdate


- (NSString *)yf_sourcePatchKey{
    return @"SOURCE_PATCH";
}



- (NSString *)yf_relativeCachePathFor:(NSString *)md5
{
    return [@"patch" stringByAppendingPathComponent:md5];
}


-(void)updateCompletion: (void(^)(BOOL isSuccess , NSDictionary *backDic,NSError *error))completion{
    
    NSString *url=@"https://raw.githubusercontent.com/ios122/ios_assets_hot_update/master/res/patch_04.json";
    [[JSNetWork shareInstance] get:url ActivityView:nil result:^(BOOL isSuccess, NSDictionary *backDic, JSError *error) {
       
       
            //网络获取
            NSString * urlStr = [self converToString:backDic[@"url"]];
            NSString * md5 = [self converToString:backDic[@"md5"]];
        
        NSString * patchCachePath1 = [self cachesPathFor: [self yf_relativeCachePathFor:md5]];
            //本地版本
            NSString * oriMd5 = [[[NSUserDefaults standardUserDefaults] objectForKey: [self yf_sourcePatchKey]] objectForKey:@"md5"];
            
            if (IS_NSString(md5) && IS_NSString(oriMd5) && [md5 isEqualToString:oriMd5]) {
                NSLog(@"no update");
            }
            else{//下载文件
                
                [[JSNetWork shareInstance]   download:urlStr progress:^(NSProgress *downloadProgress, CGFloat currentProgress) {
                    
                    NSLog(@"---currentProgress=%f",currentProgress);
                
                } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
                    
                    //解压到指定位置
                    NSString * patchCachePath = [self cachesPathFor: [self yf_relativeCachePathFor:md5]];
                    [SSZipArchive unzipFileAtPath:filePath.path toDestination: patchCachePath overwrite:YES password:nil error:&error];
                    
                    if (error) {
                        NSLog(@"unzip and move file error, with urlStr:%@ error:%@", urlStr, error);
                        completion(NO,backDic,error);
                        return;
                    }
                    else{
                        /* update patch info. */
                        NSString * yf_sourcePatchKey = [self yf_sourcePatchKey];
                        [[NSUserDefaults standardUserDefaults] setObject:backDic forKey: yf_sourcePatchKey];
                        
                        //回调
                         completion(YES,backDic,error);
                    }
                    
           
                    
                    
                    
                }];
            }

        
        
    }];
    
}

@end
