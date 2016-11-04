//
//  NSObject+FileStream.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSObject+FileStream.h"

@implementation NSObject (FileStream)


-(NSString*)readApiCacheFileName:(NSString*)fileName{
    NSString * cacheFolder = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheFolder = [cacheFolder stringByAppendingPathComponent:@"JiangSu"];
    
    //获取文件路径
    NSString *path = [cacheFolder stringByAppendingPathComponent:fileName];
    
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
}

/*
 *  @fileName   需要保存的文件名字
 */
-(void)saveApiCacheFileName:(NSString*)fileName textContent:(NSString*)content Append:(BOOL)isAppend{
    //    if ([content rangeOfString:@"["].location != NSNotFound && [content rangeOfString:@"]"].location != NSNotFound) {
    //        content = [[[[content componentsSeparatedByString:@"["] objectAtIndex:1] componentsSeparatedByString:@"]"] objectAtIndex:0];
    //    }
    //    content = [NSString stringWithFormat:@",%@",content];
    
    NSString * cacheFolder = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    cacheFolder = [cacheFolder stringByAppendingPathComponent:@"JiangSu"];
    
    NSFileManager * fmgr = [NSFileManager defaultManager];
    
    if (![fmgr fileExistsAtPath:cacheFolder])
    {
        NSError * error;
        [fmgr createDirectoryAtPath:cacheFolder withIntermediateDirectories:YES attributes:nil error:&error];
    }
    cacheFolder = [cacheFolder stringByAppendingPathComponent:fileName];
    
    
    //    if (isAppend == NO) {
    
    NSError *error=nil;
    BOOL flag=[content writeToFile:cacheFolder atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (flag){
        NSLog(@"保存成功");
    }
    else{
        NSLog(@"---error-%@",error.localizedDescription);
    }
    
    
    //    }else{
    //
    //        NSLog(@"追加内容到 :%@",cacheFolder);
    //        if (![fmgr fileExistsAtPath:cacheFolder])
    //        {
    //            NSLog(@"目录:%@ 不存在",cacheFolder);
    //            if ([@"" writeToFile:cacheFolder atomically:YES encoding:NSUTF8StringEncoding error:NULL] == YES) {
    //                NSLog(@"保存成功");
    //            }
    //        }
    //        NSFileHandle *outFile = [NSFileHandle fileHandleForWritingAtPath:cacheFolder];
    //        if (outFile == nil) {
    //            NSLog(@"Open of file for writing failed");
    //        }
    //
    //        [outFile seekToEndOfFile]; // 找到并定位到outfile的尾端位置
    //        [outFile writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
    //        [outFile closeFile];
    //        
    //    }
    
    
}


@end
