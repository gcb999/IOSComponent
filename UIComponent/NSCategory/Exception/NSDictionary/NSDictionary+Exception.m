//
//  NSDictionary+Exception.m
//  DressLink
//
//  Created by gcb999 on 16/8/23.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "NSDictionary+Exception.h"
#import "NSObject+Exception.h"

@implementation NSDictionary (Exception)

//
//+(void)load{
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    Method originalMethod = class_getClassMethod(self, @selector(dictionaryWithObjects:forKeys:count:));
//    Method swizzledMethod = class_getClassMethod(self, @selector(na_dictionaryWithObjects:forKeys:count:));
//    method_exchangeImplementations(originalMethod, swizzledMethod);
//        
//    });
//    
//}
//
//
//
//
//
//#pragma mark - setObject:forKey: 空对象的异常
//+ (instancetype)na_dictionaryWithObjects:(const id [])objects forKeys:(const id <NSCopying> [])keys count:(NSUInteger)cnt {
//    id nObjects[cnt];
//    id nKeys[cnt];
//    int i=0, j=0;
//    for (; i<cnt && j<cnt; i++) {
//        if (objects[i] && keys[i]) {
//            nObjects[j] = objects[i];
//            nKeys[j] = keys[i];
//            j++;
//        }
//    }
//    
//    return [self na_dictionaryWithObjects:nObjects forKeys:nKeys count:j];
//}


@end
