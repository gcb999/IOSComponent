//
//  JSBasicViewController+ThreeDTouch.h
//  SailvanElec
//
//  Created by gcb999 on 16/5/24.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@interface JSBasicViewController (ThreeDTouch)


#pragma mark -注册3DTouch 功能
-(void)register3DTouchWithSourceView:(UIView *)sourceView  peekViewCtrCls:(Class)peekCls;

@property(nonatomic,strong)Class peekCls;

#pragma mark -Peek 手势
//Peek
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location;

#pragma mark -POP 手势
-(void) popViewController:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit;


@end
