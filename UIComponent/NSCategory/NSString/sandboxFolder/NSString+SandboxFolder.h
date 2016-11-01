//
//  NSString+SandboxFolder.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SandboxFolder)

/**
 *  转为documents下的子文件夹
 */
@property (nonatomic,copy,readonly) NSString *documentsSubFolder;

@end
