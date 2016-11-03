//
//  NSString+Regular.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regular)

/**
 *  正则表达式验证UserName
 */
- (BOOL)checkUserName:(NSString *)userName;

/**
 *  正则表达式验证Password
 */
- (BOOL)checkPassword:(NSString *)password;

/**
 *  正则表达式验证Email
 */
- (BOOL)checkEmail:(NSString *)email;

/**
 *  正则表达式验证URL
 */
- (BOOL)checkURL:(NSString *)url;

/**
 *  正则表达式验证TelephoneNumber
 */
- (BOOL)checkTelephoneNumber:(NSString *)telephoneNumber;

@end
