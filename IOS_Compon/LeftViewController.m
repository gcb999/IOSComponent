//
//  LeftViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "LeftViewController.h"

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=KCOLOR_RED;
    [[JSTabBarControllerConfig shareInstance] showBadgeOnItemIndex:1 badge:@"2" animation:YES];
}
@end
