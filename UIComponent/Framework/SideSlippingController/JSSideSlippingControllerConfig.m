//
//  JSSideSlippingConfig.m
//  SailvanElec
//
//  Created by gcb999 on 16/6/4.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSSideSlippingControllerConfig.h"


//https://github.com/gotosleep/JASidePanels




@implementation JSSideSlippingControllerConfig


-(JASidePanelController *)sidePanelController{
    
    if (_sidePanelController==nil) {
            _sidePanelController = [[JASidePanelController alloc] init];
      
            
            _sidePanelController.view.backgroundColor=[UIColor whiteColor];
        
            //左视图间距
            _sidePanelController.leftGapPercentage = self.leftGapPercentage;   //左边的viewcontroller显示的宽度
            _sidePanelController.bounceOnSidePanelClose = YES;  //当关闭侧边栏的时候不反弹

            _sidePanelController.bounceDuration = 0.1f;
            _sidePanelController.bouncePercentage = 0.075f;
            _sidePanelController.panningLimitedToTopViewController = YES;
            _sidePanelController.recognizesPanGesture = YES;
            _sidePanelController.allowLeftOverpan = YES;
            _sidePanelController.allowRightOverpan = YES;
            _sidePanelController.bounceOnSidePanelOpen = YES;
            _sidePanelController.shouldDelegateAutorotateToVisiblePanel = NO;
        
        
            //右视图间距
//            _sidePanelController.rightGapPercentage = 0.3;   //左边的viewcontroller显示的宽度

        
    }
    return _sidePanelController;
}

#pragma mark --左边

-(LeftViewController *)leftController{
    if (_leftController==nil) {
        _leftController=(LeftViewController *)self.sidePanelController.leftPanel;
    }
    return _leftController;
}


#pragma mark -中间

-(UINavigationController *)centerController{
    if (_centerController==nil) {
        _centerController=(UINavigationController *)self.sidePanelController.centerPanel;
    }
    return _centerController;
}



-(CGFloat)leftGapPercentage{
    
    return 0.8;
}


-(instancetype )initWithLeftPanel:(Class)leftPanel centerPanel:(Class)centerPanel  rightPanel:(Class)rightPanel{
   
    if (self=[super init]) {
        
    //左边控制器
    
    if(leftPanel){
        
        UIViewController *leftVc=[[leftPanel  alloc] init];
        self.sidePanelController.leftPanel = leftVc;  //添加左边的viewcontroller

    }
   

    //中间
    if (centerPanel) {
        
        UIViewController *mainCtrl = [[centerPanel  alloc] init];
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:mainCtrl];
        self.sidePanelController.centerPanel = nav;  //添加中间的viewcontroller
    }
    
    
    //右边控制器
    if (rightPanel) {
        UIViewController *rightVc=[[rightPanel alloc] init];
        self.sidePanelController.rightPanel=rightVc;//添加右边的viewcontroller
    }
        
    }
    return self;
    

}



#pragma mark -显示中间控制器
-(void)showCenterPanel{
    [self.sidePanelController showCenterPanelAnimated:YES];
}

#pragma mark -显示中间控制器
-(void)exitRootViewControllerForShowCenterPanel{
    //1：退出根控制器
    UINavigationController *nav=(UINavigationController *)self.sidePanelController.centerPanel;
    NSInteger count= nav.childViewControllers.count;
    if(count>1){
        [nav popToRootViewControllerAnimated:NO];
    }
    else{
        [nav popToRootViewControllerAnimated:YES];
    }
    //2：展示中间
    [self.sidePanelController showCenterPanelAnimated:YES];

}

#pragma mark -显示左侧控制器
-(void)showLeftPanel{
    [self.sidePanelController showLeftPanelAnimated:YES];
}

#pragma mark -显示右侧控制器
-(void)showRightPanel{
    [self.sidePanelController showRightPanelAnimated:YES];
}



#pragma mark -单例类
static JSSideSlippingControllerConfig * _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [JSSideSlippingControllerConfig shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSSideSlippingControllerConfig shareInstance] ;
}


@end
