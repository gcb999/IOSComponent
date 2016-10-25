//
//  NSString+String.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSString+String.h"

@implementation NSString (String)

//判断字符串中是否包含内容
-(BOOL) contains:(NSString *)sFind
{
    NSRange rangeFind = [self rangeOfString:sFind];    
    return rangeFind.location != NSNotFound ? YES : NO;

}

/**
 *  indexOf
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
-(unsigned long)indexOf:(NSString*)str{
    NSRange range = [self rangeOfString:str];
    return range.location;
}
/**
 *  split
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
-(NSArray*)split:(NSString*)str{
    NSArray* arrays = [self componentsSeparatedByString:str];
    if(arrays.count > 1){
        return arrays;
    }
    return nil;
    
}
/**
 *  subString
 *
 *  @param start <#start description#>
 *  @param end   <#end description#>
 *
 *  @return <#return value description#>
 */
-(NSString*)substring:(int)start:(int)end{
    return [self substringWithRange: NSMakeRange(start, end)];
}
-(NSString*)substring:(int)start{
    return [self substringFromIndex:start];
}
- (NSString *)substringWithString:(NSString *)str begin:(NSInteger)begin end:(NSInteger )end {
    return [str substringWithRange:NSMakeRange(begin, end)];
}



@end
