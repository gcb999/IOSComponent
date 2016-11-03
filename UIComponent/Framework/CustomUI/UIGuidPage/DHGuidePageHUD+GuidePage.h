//
//  DHGuidePageHUD+GuidePage.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "DHGuidePageHUD.h"

@interface DHGuidePageHUD (GuidePage)





@end


/*-----------------------用法 (可以进去自定义控件位置）-----------------------
 
 https://github.com/dingding3w/DHGuidePageHUD
 http://www.cnblogs.com/dingding3w/p/5952075.html
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 // 设置APP引导页
 if ([[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
 [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
 // 静态引导页
 [self setStaticGuidePage];
 
 // 动态引导页
 // [self setDynamicGuidePage];
 
 // 视频引导页
 // [self setVideoGuidePage];
 }
 
 // 设置该控制器背景图片
 self.view addSubview:bg_imageView];
 
 }

 
 
 
 #pragma mark - 设置APP静态图片引导页
 - (void)setStaticGuidePage {
 NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
 DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
 guidePage.slideInto = YES;
 [self.navigationController.view addSubview:guidePage];
    //[[UIWindow window] addSubview:guidePage];
 }
 
 #pragma mark - 设置APP动态图片引导页
 - (void)setDynamicGuidePage {
 NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
 DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
 guidePage.slideInto = YES;
 [self.navigationController.view addSubview:guidePage];
       //[[UIWindow window] addSubview:guidePage];
 }
 
 #pragma mark - 设置APP视频引导页
 - (void)setVideoGuidePage {
 NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guideMovie1" ofType:@"mov"]];
 DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.bounds videoURL:videoURL];
 [self.navigationController.view addSubview:guidePage];
    //[[UIWindow window] addSubview:guidePage];
 }


-----------------------用法-----------------------*/