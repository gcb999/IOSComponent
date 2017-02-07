//
//  NSObject+TypeConversion.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSObject+TypeConversion.h"

@implementation NSObject (TypeConversion)


-(NSString *)converToString:(NSString *)string{
    
    return IS_NSString(string)?string:@"";
}

-(NSArray *)converToArray:(NSArray *)array{
    
    return IS_NSArray(array)?array:@[];
}

-(NSDictionary *)converToDictionary:(NSDictionary *)dictionary{
    
    return IS_NSDictionary(dictionary)?dictionary:@{};
}




@end
