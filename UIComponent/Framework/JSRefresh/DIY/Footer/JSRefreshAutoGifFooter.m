//
//  JSRefreshAutoGifFooter.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSRefreshAutoGifFooter.h"

@interface JSRefreshAutoGifFooter()

@property (strong, nonatomic) UIImageView *logoImageView;



@end


@implementation JSRefreshAutoGifFooter


#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
#pragma mark -设置新控件
    // 设置控件的高度
    self.mj_h = 50;
 
  
    self.logoImageView =[UIImageView imageViewImageName:CGRectMake(0, 0, 20, 20) gifName:@"iOS_loading.gif"];
    self.logoImageView.center=CGPointMake(20, 50*0.5f);
    [self addSubview:self.logoImageView ];
}


- (void)placeSubviews
{
    [super placeSubviews];
 
    
    if (self.logoImageView.constraints.count) return;
    
//    self.logoImageView.frame = self.bounds;
//    if (self.isRefreshingTitleHidden) {
//        self.logoImageView.contentMode = UIViewContentModeCenter;
//    } else {
//        self.logoImageView.contentMode = UIViewContentModeRight;
//        self.logoImageView.mj_w = self.mj_w * 0.5 - self.labelLeftInset - self.stateLabel.mj_textWith * 0.5;
//    }


 
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    

    
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {//显示
        self.logoImageView.hidden =NO;
    } else if (state == MJRefreshStateRefreshing) {//隐藏
        self.logoImageView.hidden =YES;
    }

}


@end
