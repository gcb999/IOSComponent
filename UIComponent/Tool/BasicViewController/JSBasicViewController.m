//
//  DLBasicViewController.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"
#import "JSSimpleNotMoreDataViewHelper.h"




@interface JSBasicViewController ()
{
    
}

@end

@implementation JSBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:KCOLOR_BLACK, UITextAttributeTextColor,[UIFont fontWithName:@"Arial" size:16], UITextAttributeFont,nil]];
    self.navTitleLabel = [UILabel LabWithFrame:CGRectMake(0, 0, IPHONScreenWidth - 200, 30) text:@"" textColor:KCOLOR_BLACK textAlign:NSTextAlignmentCenter font:[UIFont fontWithName:@"Arial" size:16]];
    self.navTitleLabel.center = CGPointMake(IPHONScreenWidth / 2, 22);
    self.navigationItem.titleView = self.navTitleLabel;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //解决滚动视图20像素的偏移

    
//    self.navigationController.navigationBarHidden = NO;
 
    self.fd_prefersNavigationBarHidden = NO;//--侧滑不需要
    
    if(IOS7){
        self.edgesForExtendedLayout=UIRectEdgeNone;
//        self.automaticallyAdjustsScrollViewInsets = NO;
    }

//    UIButton *backBtn=[UIButton ButtonWithImageName:@"back_default_icon" hImageName:@"back_default_icon" frame:CGRectMake(0, 0, 20, 20) title:nil titleColor:nil font:nil target:self action:@selector(back)];
//    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithCustomView:backBtn];
////    backItem.width=-16;
//    self.navigationItem.backBarButtonItem=backItem;

    [self addBack];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
//    @try {
//        
//        //添加GA页面统计
//        [[JSGoogleAnalytics shareInstance] SetTracker:self];
//        
//        if ([self isKindOfClass:[DLCartListViewController class]]) {
//            return;
//        }
// 
//        
//        NSString *car= [JSUserSingletonModel share].carQty;
//        if (IS_NSString(car)) {
//                
//            NSInteger num= [car integerValue];
//            if (num>0) {
//                UIBarButtonItem *item=self.navigationItem.rightBarButtonItems[0];
//                item.badgeCenterOffset = CGPointMake(-3, 5);
//                [item showBadge];
//            }
//            else{
//                UIBarButtonItem *item=self.navigationItem.rightBarButtonItems[0];
//                [item clearBadge];
//            }
//            
//        }
//        else{
//            UIBarButtonItem *item=self.navigationItem.rightBarButtonItems[0];
//            [item clearBadge];
//        }
//        
//    } @catch (NSException *exception) {
//        
//    } @finally {
//        
//    }
//    

    
 
    
}


#pragma mark -添加购物车导航按钮

-(void)addCartAndSearch{

    //多个rightItem设置:
    UIButton *searchBtn=[UIButton ButtonWithImageName:@"search_default" hImageName:@"search_default" frame:CGRectMake(0, 0, 20,20) title:nil titleColor:nil font:nil target:self action:@selector(search)];
    UIBarButtonItem *searchItem=[[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    searchItem.width=-32;
    
    UIButton *carBtn=[UIButton ButtonWithImageName:@"cart_default_icon" hImageName:@"cart_press_icon" frame:CGRectMake(0, 0, 20, 20) title:nil titleColor:nil font:nil target:self action:@selector(car)];
    UIBarButtonItem *carItem=[[UIBarButtonItem alloc] initWithCustomView:carBtn];
    carItem.width=-16;
    self.navigationItem.rightBarButtonItems=@[carItem,searchItem];
}


-(void)addCart{
    
    UIButton *carBtn=[UIButton ButtonWithImageName:@"cart_default_icon" hImageName:@"cart_press_icon" frame:CGRectMake(0, 0, 20, 20) title:nil titleColor:nil font:nil target:self action:@selector(car)];
    UIBarButtonItem *carItem=[[UIBarButtonItem alloc] initWithCustomView:carBtn];
    carItem.width=-16;
    self.navigationItem.rightBarButtonItems=@[carItem];
}

- (void)addBack
{
    UIButton *backBtn=[UIButton ButtonWithImageName:@"back_default_icon" hImageName:@"back_press_icon" frame:CGRectMake(0, 0, 20, 20) title:nil titleColor:nil font:nil target:self action:@selector(back)];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithCustomView:backBtn];
    backItem.width=-16;
    self.navigationItem.leftBarButtonItems=@[backItem];
}

- (void)addLeftSide
{
    
    UIButton *backBtn=[UIButton ButtonWithImageName:@"side_bar_default_icon" hImageName:@"side_bar_press_icon" frame:CGRectMake(0, 0, 20, 20) title:nil titleColor:nil font:nil target:self action:@selector(leftSide)];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithCustomView:backBtn];
    backItem.width=-16;
    self.navigationItem.leftBarButtonItems=@[backItem];

}

#pragma mark -点击事件
//点击购物车
-(void)car{
    [self.view endEditing:YES];
    
}

//点击搜索
-(void)search{
    
    [self.view endEditing:YES];


}
//点击返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

//点击左栏
- (void)leftSide
{
    [self.view endEditing:YES];
    [[JSSideSlippingControllerConfig shareInstance] showLeftPanel];

}

#pragma mark -无网络和无数据页面处理

-(void)NotMoreDataView:(JSError *)error  style:(NotDataStyle) style {
    

    for (UIView *childView in self.view.subviews) {
        if ([childView isMemberOfClass:[JSSimpleNotMoreDataViewHelper class]]) {
            [childView removeFromSuperview];
        }
    }
    

    JSSimpleNotMoreDataViewHelper *helper=nil;
    if(error){//错误页面
        
        if (error.errorState==ErrorState_notWork) {//无网络
                helper=[[JSSimpleNotMoreDataViewHelper alloc] initWithFrame:self.view.bounds style:NotDataStyle_NotWork_Click delegate:self];
                [self.view addSubview:helper];
        }
        else if (error.errorState==ErrorState_SessionExpire){//session过期
//            DLLoginViewController * ctrl = [[DLLoginViewController alloc] initWithBlock:^{
//                
//            }];
//            [ctrl hideClose];
//            
//            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:ctrl];
//            [self.navigationController  presentViewController:nav animated:YES completion:^{
//                
//            }];
        }
        
        else{
            if (style!=NotDataStyle_None) {

                helper=[[JSSimpleNotMoreDataViewHelper alloc] initWithFrame:self.view.bounds style:style delegate:self];
                [self.view addSubview:helper];
            }
        }
    }
    else{//返回成功但是没有数据
        
        if (style!=NotDataStyle_None) {
            
            helper=[[JSSimpleNotMoreDataViewHelper alloc] initWithFrame:self.view.bounds style:style delegate:self];
            [self.view addSubview:helper];
          
        }
    }
 
}






@end
