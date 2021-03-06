//
//  NSString+SandboxFolder.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSString+SandboxFolder.h"

@implementation NSString (SandboxFolder)


/**
 *  转为documents下的子文件夹
 */
-(NSString *)documentsSubFolder{
    
    NSString *documentFolder=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    return [NSString makeSubFolderInSuperFolder:documentFolder subFloder:self];
    
}



/**
 *  文件夹处理
 */
+(NSString *)makeSubFolderInSuperFolder:(NSString *)superFolder subFloder:(NSString *)subFloder{
    
    NSString *folder=[NSString stringWithFormat:@"%@/%@",superFolder,subFloder];
    
    BOOL isDir = NO;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL existed = [fileManager fileExistsAtPath:folder isDirectory:&isDir];
    
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return folder;
}

/**
 *  沙盒Cache
 */

+ (NSString *)cachesPathFor:(NSString * )path
{
    NSArray * LibraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * cachePath = [[[LibraryPaths objectAtIndex:0] stringByAppendingFormat:@"/Caches"] stringByAppendingPathComponent:path];
    
    return cachePath;
}



@end
