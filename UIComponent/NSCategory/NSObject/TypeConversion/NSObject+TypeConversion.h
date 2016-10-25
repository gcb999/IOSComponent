//
//  NSObject+TypeConversion.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TypeConversion)


//字符串装换
-(NSString *)typeConversionToString:(NSString *)string;

//数组转换
-(NSArray *)typeConversionToArray:(NSArray *)array;

//字典转换
-(NSDictionary *)typeConversionToDictionary:(NSDictionary *)dictionary;



@end
