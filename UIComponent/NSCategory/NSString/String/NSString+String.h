//
//  NSString+String.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (String)


//判断字符串中是否包含内容
-(BOOL) contains:(NSString *)sFind;

/**
 *  indexOf
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
-(unsigned long)indexOf:(NSString*)str;



/**
 *  split
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
-(NSArray*)split:(NSString*)str;


/**
 *  subString
 *
 *  @param start <#start description#>
 *  @param end   <#end description#>
 *
 *  @return <#return value description#>
 */
-(NSString*)substring:(int)start:(int)end;



-(NSString*)substring:(int)start;


- (NSString *)substringWithString:(NSString *)str begin:(NSInteger)begin end:(NSInteger )end;

@end
