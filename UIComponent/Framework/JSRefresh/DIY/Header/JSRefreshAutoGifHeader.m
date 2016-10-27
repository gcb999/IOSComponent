//
//  JSRefreshAutoGifHeader.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSRefreshAutoGifHeader.h"



@interface JSRefreshAutoGifHeader()

@property (strong, nonatomic) UIImageView *logoImageView;



@end

@implementation JSRefreshAutoGifHeader

#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
#pragma mark -隐藏父类控件
    
    
    
#pragma mark -设置新控件
    // 设置控件的高度
    self.mj_h = 50;
    
    
    
    self.logoImageView =[UIImageView imageViewImageName:CGRectMake(0, 0, 20, 20) gifName:@"iOS_loading.gif"];
    self.logoImageView.center=CGPointMake(20, 50*0.5f);
    [self addSubview:self.logoImageView ];
   
    
    
    
    
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    
    
    
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            
            
            break;
        case MJRefreshStatePulling:
            
            
            break;
        case MJRefreshStateRefreshing:
            
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
    //    self.textlabel.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


@end
