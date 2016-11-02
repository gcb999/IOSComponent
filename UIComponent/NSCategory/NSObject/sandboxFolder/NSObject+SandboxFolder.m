//
//  NSObject+SandboxFolder.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSObject+SandboxFolder.h"

@implementation NSObject (SandboxFolder)


/**
 *  沙盒Cache
 */

- (NSString *)cachesPathFor:(NSString * )path
{
    NSArray * LibraryPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString * cachePath = [[[LibraryPaths objectAtIndex:0] stringByAppendingFormat:@"/Caches"] stringByAppendingPathComponent:path];
    
    return cachePath;
}


@end
