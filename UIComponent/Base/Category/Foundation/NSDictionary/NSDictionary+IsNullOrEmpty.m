//
//  NSDictionary+IsNullOrEmpty.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/7.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "NSDictionary+IsNullOrEmpty.h"

@implementation NSDictionary (IsNullOrEmpty)


-(BOOL)isNullOrEmpty{
    
    if (self !=nil && [self isKindOfClass:[NSDictionary class]] && self.allKeys.count>0 ) {
        return YES;
    }
    
    return NO;
}

@end
