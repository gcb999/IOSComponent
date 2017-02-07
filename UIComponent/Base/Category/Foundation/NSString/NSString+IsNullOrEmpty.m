//
//  NSString+IsNullOrEmpty.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/7.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "NSString+IsNullOrEmpty.h"

@implementation NSString (IsNullOrEmpty)


-(BOOL)isNullOrEmpty{
    
    if (self !=nil && [self isKindOfClass:[NSString class]] && self.length>0 ) {
        return YES;
    }
    
    return NO;
}

@end
