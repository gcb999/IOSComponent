//
//  UIColor+Hex.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

#pragma mark  十六进制颜色
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString{
    return [self colorWithHexColorString:hexColorString alpha:1.0f];
}




#pragma mark  十六进制颜色
+ (UIColor *)colorWithHexColorString:(NSString *)hexColorString alpha:(float)alpha{
    
    if ([hexColorString length] <6){//长度不合法
        return [UIColor clearColor];
    }
    NSString *tempString=[hexColorString lowercaseString];
    if ([tempString hasPrefix:@"0X"]){//检查开头是0x
        tempString = [tempString substringFromIndex:2];
    }
    else if ([tempString hasPrefix:@"#"]){//检查开头是#
        tempString = [tempString substringFromIndex:1];
    }
    if ([tempString length] != 6){
        return [UIColor clearColor];
    }
    //分解三种颜色的值
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    // r
    NSString *rString = [tempString substringWithRange:range];
    // g
    range.location = 2;
    NSString *gString = [tempString substringWithRange:range];
    // b
    range.location = 4;
    NSString *bString = [tempString substringWithRange:range];
    //取三种颜色值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString]scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float) r /255.0f)
                           green:((float) g /255.0f)
                            blue:((float) b /255.0f)
                           alpha:alpha];
    
    
}


@end
