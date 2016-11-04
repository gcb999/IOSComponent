//
//  NSNull+Exception.m
//  DressLink
//
//  Created by gcb999 on 16/8/23.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "NSNull+Exception.h"

@implementation NSNull (Exception)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *signature = [super methodSignatureForSelector:sel];
    if (!signature) {
        signature = [NSMethodSignature signatureWithObjCTypes:@encode(void)];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
}

@end
