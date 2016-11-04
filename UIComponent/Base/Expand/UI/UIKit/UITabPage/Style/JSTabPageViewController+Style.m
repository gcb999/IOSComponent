//
//  JSTabPageViewController+Style.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTabPageViewController+Style.h"

@implementation JSTabPageViewController (Style)


#pragma mark -默认样式

-(void)setupNomal{
    /*
     字体下面slider的颜色  //这是我们公司的主题色
     */
    //    self.magicView.sliderColor = KCOLOR_RED;
    //    self.magicView.bounces = YES;
    //    self.magicView.headerHidden = NO;
    //    self.magicView.itemSpacing = 20.f;
    //    self.magicView.switchEnabled = YES;
    //    self.magicView.separatorHidden = NO;
    
    self.magicView.itemScale = 1.2;
     self.magicView.itemSpacing =(IPHONScreenWidth - 120)/self.vcs.count;
    
    
#pragma mark -头部headerView
//    self.magicView.headerHeight = 40;
//    self.magicView.headerView.backgroundColor = RGBCOLOR(243, 40, 47);
    self.magicView.headerHidden=YES;
 #pragma mark -导航栏
    self.magicView.navigationHeight = 44;
    self.magicView.againstStatusBar = NO;
    //    self.magicView.sliderExtension = 5.0;
    //    self.magicView.switchStyle = VTSwitchStyleStiff;
    //    self.magicView.navigationInset = UIEdgeInsetsMake(0, 50, 0, 0);

    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.layoutStyle = VTLayoutStyleDefault;
    self.view.backgroundColor = RGBCOLOR(243, 40, 47);
  
    //默认选中
    [self.magicView reloadDataToPage:0];
}

#pragma mark -气泡样式

-(void)setupBubble{
    
    
#pragma mark -字体下面slider的颜色
    
    self.magicView.sliderColor = RGBCOLOR(169, 37, 37);
    
#pragma mark -头部headerView
    self.magicView.headerHidden=YES;
    
#pragma mark -导航栏高度
    self.magicView.navigationHeight = 44;
    self.magicView.againstStatusBar = NO;
    
#pragma mark -导航栏颜色
    self.magicView.navigationColor = [UIColor whiteColor];
    
    
#pragma mark -样式
    self.magicView.switchStyle = VTSwitchStyleDefault;
    self.magicView.sliderStyle = VTSliderStyleBubble;
    self.magicView.sliderColor = RGBCOLOR(229, 229, 229);
    self.magicView.bubbleInset = UIEdgeInsetsMake(2, 7, 2, 7);
    self.magicView.bubbleRadius = 10;
    
    
#pragma mark -默认选中
    [self.magicView reloadDataToPage:0];

    
}

#pragma mark -居中样式（一般2个）
-(void)setupMiddle{
  
    
#pragma mark -字体下面slider的颜色
    
self.magicView.sliderColor = RGBCOLOR(169, 37, 37);
    
#pragma mark -头部headerView
    self.magicView.headerHidden=YES;
    
#pragma mark -导航栏高度
    self.magicView.navigationHeight = 44;
    self.magicView.againstStatusBar = NO;
    
#pragma mark -导航栏颜色
    self.magicView.navigationColor = [UIColor whiteColor];

    
#pragma mark -样式
    self.magicView.switchStyle = VTSwitchStyleDefault;
    self.magicView.layoutStyle = VTLayoutStyleCenter;


#pragma mark -默认选中
    [self.magicView reloadDataToPage:0];
}


#pragma mark -带图片箭头（一般2个）
-(void)setupDivide{
    
    
#pragma mark -自定义slider
    
    UIImageView *sliderView = [[UIImageView alloc] init];
    [sliderView setImage:[UIImage imageNamed:@"magic_arrow"]];
    sliderView.contentMode = UIViewContentModeScaleAspectFit;
    [self.magicView setSliderView:sliderView];
    self.magicView.sliderHeight = 5.f;
    self.magicView.sliderOffset = -2;
    
#pragma mark -头部headerView
    self.magicView.headerHidden=YES;
    
#pragma mark -导航栏高度
    self.magicView.navigationHeight = 44;
    self.magicView.againstStatusBar = NO;
    
#pragma mark -导航栏颜色
    self.magicView.navigationColor = [UIColor whiteColor];
    
    
#pragma mark -样式
    self.magicView.switchStyle = VTSwitchStyleDefault;
    self.magicView.layoutStyle = VTSwitchStyleStiff;
    
      self.magicView.needPreloading = NO;
    
#pragma mark -默认选中
    [self.magicView reloadDataToPage:0];
}




@end
