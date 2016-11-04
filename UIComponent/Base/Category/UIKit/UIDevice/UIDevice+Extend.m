//
//  UIDevice+Extend.m
//  CoreCategory
//
//  Created by 成林 on 15/5/6.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "UIDevice+Extend.h"

#import <sys/utsname.h>



@implementation UIDevice (Extend)

+(NSString *)deviceModel{
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString* code = [NSString stringWithCString:systemInfo.machine
                                        encoding:NSUTF8StringEncoding];
    
    static NSDictionary* deviceNamesByCode = nil;
    
    if (!deviceNamesByCode) {
        
        deviceNamesByCode  = @{
                              @"i386"      : Device_Simulator,
                              @"x86_64"    : Device_Simulator,
                              @"iPod1,1"   : Device_iPod1,
                              @"iPod2,1"   : Device_iPod2,
                              @"iPod3,1"   : Device_iPod3,
                              @"iPod4,1"   : Device_iPod4,
                              @"iPod5,1"   : Device_iPod5,
                              @"iPad2,1"   : Device_iPad2,
                              @"iPad2,2"   : Device_iPad2,
                              @"iPad2,3"   : Device_iPad2,
                              @"iPad2,4"   : Device_iPad2,
                              @"iPad2,5"   : Device_iPadMini1,
                              @"iPad2,6"   : Device_iPadMini1,
                              @"iPad2,7"   : Device_iPadMini1,
                              @"iPhone3,1" : Device_iPhone4,
                              @"iPhone3,2" : Device_iPhone4,
                              @"iPhone3,3" : Device_iPhone4,
                              @"iPhone4,1" : Device_iPhone4S,
                              @"iPhone5,1" : Device_iPhone5,
                              @"iPhone5,2" : Device_iPhone5,
                              @"iPhone5,3" : Device_iPhone5C,
                              @"iPhone5,4" : Device_iPhone5C,
                              @"iPad3,1"   : Device_iPad3,
                              @"iPad3,2"   : Device_iPad3,
                              @"iPad3,3"   : Device_iPad3,
                              @"iPad3,4"   : Device_iPad4,
                              @"iPad3,5"   : Device_iPad4,
                              @"iPad3,6"   : Device_iPad4,
                              @"iPhone6,1" : Device_iPhone5S,
                              @"iPhone6,2" : Device_iPhone5S,
                              @"iPad4,1"   : Device_iPadAir1,
                              @"iPad4,2"   : Device_iPadAir2,
                              @"iPad4,4"   : Device_iPadMini2,
                              @"iPad4,5"   : Device_iPadMini2,
                              @"iPad4,6"   : Device_iPadMini2,
                              @"iPad4,7"   : Device_iPadMini3,
                              @"iPad4,8"   : Device_iPadMini3,
                              @"iPad4,9"   : Device_iPadMini3,
                              @"iPhone7,1" : Device_iPhone6plus,
                              @"iPhone7,2" : Device_iPhone6,
                              @"iPhone8,1" : Device_iPhone6S,
                              @"iPhone8,2" : Device_iPhone6Splus
                              };
    }
    
    NSString* deviceName = [deviceNamesByCode objectForKey:code];
    if(deviceName){
        return deviceName;
    }
    
    return Device_Unrecognized;
}
@end

