//
//  DLBasicViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

//导航手势
#import "UINavigationController+FDFullscreenPopGesture.h"
@class JSError;

@interface JSBasicViewController : UIViewController<UIViewControllerPreviewingDelegate>
@property (nonatomic , strong) UILabel *navTitleLabel;

#pragma mark -添加购物车导航按钮和搜索
-(void)addCartAndSearch;

#pragma mark -添加购物车导航按钮
-(void)addCart;

- (void)addLeftSide;

- (void)addBack;

//点击左栏
- (void)leftSide;

#pragma mark -无网络和无数据页面处理
//-(void)NotMoreDataView:(JSError *)error  style:(NotDataStyle) style;

@end
