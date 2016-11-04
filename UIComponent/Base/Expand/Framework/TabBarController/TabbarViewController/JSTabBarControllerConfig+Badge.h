//
//  JSTabBarControllerConfig+Badge.h
//  kit
//
//  Created by gcb999 on 16/6/14.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabBarControllerConfig.h"

@interface JSTabBarControllerConfig (Badge)

- (void)showBadgeOnItemIndex:(int)index badge:(NSString *)badge animation:(BOOL)animation;

- (void)hideBadgeOnItemIndex:(int)index;

@end
