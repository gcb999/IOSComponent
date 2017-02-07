//
//  NSArray+IsNullOrEmpty.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/7.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "NSArray+IsNullOrEmpty.h"

@implementation NSArray (IsNullOrEmpty)

-(BOOL)isNullOrEmpty{
    
    if (self !=nil && [self isKindOfClass:[NSArray class]] && self.count>0 ) {
        return YES;
    }
    
    return NO;
}

@end
