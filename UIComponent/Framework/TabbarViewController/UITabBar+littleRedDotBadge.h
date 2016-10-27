//
//  UITabBar+littleRedDotBadge.h
//  kit
//
//  Created by gcb999 on 16/6/15.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (littleRedDotBadge)

- (void)showBadgeOnItemIndex:(int)index badge:(NSString *)badge animation:(BOOL)animation;

- (void)hideBadgeOnItemIndex:(int)index;

@end
