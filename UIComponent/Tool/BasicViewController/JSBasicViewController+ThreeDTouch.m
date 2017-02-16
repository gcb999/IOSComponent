//
//  JSBasicViewController+ThreeDTouch.m
//  SailvanElec
//
//  Created by gcb999 on 16/5/24.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSBasicViewController+ThreeDTouch.h"

@implementation JSBasicViewController (ThreeDTouch)


#pragma mark -注册3DTouch 功能

-(void)register3DTouchWithSourceView:(UIView *)sourceView  peekViewCtrCls:(Class)peekCls{
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable){
        
        [self registerForPreviewingWithDelegate:self sourceView:sourceView];
        self.peekCls=peekCls;
        
        NSLog(@"3D Touch  可用!");
        
    }else{
        
        NSLog(@"3D Touch 无效");
    }
}


/**
 *  peek手势
 */
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    //避免重复
    if ([self.presentedViewController isKindOfClass:self.peekCls]){
        return nil;
    }
    else {
        
        if ([self respondsToSelector:@selector(previewingContext:viewControllerForLocation:)]) {
            
            return [self previewingContext:previewingContext viewControllerForLocation:location];
        }
        else{
            
            UIViewController *ctrl=(UIViewController *)[[self.peekCls alloc] init];
            return ctrl;
        }
        
        
    }
}


/**
 *  pop手势
 */
-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    
    [self previewingContext:previewingContext commitViewController:viewControllerToCommit];
}




@end
