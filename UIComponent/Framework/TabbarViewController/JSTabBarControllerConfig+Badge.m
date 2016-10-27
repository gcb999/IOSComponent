//
//  JSTabBarControllerConfig+Badge.m
//  kit
//
//  Created by gcb999 on 16/6/14.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabBarControllerConfig+Badge.h"
#import "UITabBar+littleRedDotBadge.h"

@implementation JSTabBarControllerConfig (Badge)

- (void)showBadgeOnItemIndex:(int)index badge:(NSString *)badge animation:(BOOL)animation{
    [[JSTabBarControllerConfig shareInstance].tabBarController.tabBar showBadgeOnItemIndex:index badge:badge animation:animation];
}

- (void)hideBadgeOnItemIndex:(int)index{
    [[JSTabBarControllerConfig shareInstance].tabBarController.tabBar hideBadgeOnItemIndex:index];
}

@end
