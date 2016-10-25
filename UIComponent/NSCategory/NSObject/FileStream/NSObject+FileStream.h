//
//  NSObject+FileStream.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FileStream)


#pragma mark -读取文件
-(NSString*)readApiCacheFileName:(NSString*)fileName;


#pragma mark -写入文件
-(void)saveApiCacheFileName:(NSString*)fileName textContent:(NSString*)content Append:(BOOL)isAppend;



@end
