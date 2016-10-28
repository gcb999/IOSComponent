//
//  JSTabPageViewController+Parts.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTabPageViewController+Parts.h"

@implementation JSTabPageViewController (Parts)

- (void)integrateComponents {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [rightButton addTarget:self action:@selector(subscribeAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:RGBACOLOR(169, 37, 37, 0.6) forState:UIControlStateSelected];
    [rightButton setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateNormal];
    [rightButton setTitle:@"+" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    rightButton.center = self.view.center;
    self.magicView.rightNavigatoinItem = rightButton;
}

#pragma mark - actions
- (void)subscribeAction {
    NSLog(@"取消／恢复菜单栏选中状态");
    // select/deselect menu item
    if (self.magicView.isDeselected) {
        [self.magicView reselectMenuItem];
        self.magicView.sliderHidden = NO;
    } else {
        [self.magicView deselectMenuItem];
        self.magicView.sliderHidden = YES;
    }
}

@end
