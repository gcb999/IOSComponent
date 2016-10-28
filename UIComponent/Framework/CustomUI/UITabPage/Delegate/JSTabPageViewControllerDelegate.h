//
//  JSTabPageViewControllerDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

@protocol JSTabPageViewControllerDelegate <NSObject>

-(void)pageViewController:(UIViewController *)viewController menuInfo:(MenuInfo*)menuInfo;

@end
