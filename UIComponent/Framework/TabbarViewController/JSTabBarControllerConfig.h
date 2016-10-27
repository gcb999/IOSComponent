//
//  JSTabBarControllerConfig.h
//  kit
//
//  Created by gcb999 on 16/6/14.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

@interface JSTabBarControllerConfig : NSObject

+(instancetype) shareInstance;

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;

@end
