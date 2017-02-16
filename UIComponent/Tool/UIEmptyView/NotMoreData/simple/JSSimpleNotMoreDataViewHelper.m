//
//  JSSimpleNotMoreDataViewHelper.m
//  DressLink
//
//  Created by gcb999 on 16/6/28.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "JSSimpleNotMoreDataViewHelper.h"




@interface JSSimpleNotMoreDataViewHelper ()
{
    JSSimpleNotMoreDataView *notDataView;
    
}
@property(nonatomic,weak)id<JSSimpleNotMoreDataViewHelperDelegate> delegate;
@property(nonatomic,assign)NotDataStyle style;

@end

@implementation JSSimpleNotMoreDataViewHelper

- (instancetype)initWithFrame:(CGRect)frame style:(NotDataStyle)style delegate:(id<JSSimpleNotMoreDataViewHelperDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //代理
        self.delegate=delegate;
        self.style=style;
        
        //添加View
        notDataView=[[JSSimpleNotMoreDataView alloc] initWithFrame:self.bounds];
        notDataView.backgroundColor=[UIColor whiteColor];
        [notDataView.reloadButton addTarget:self action:@selector(reloadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self setup:style];
        [self addSubview:notDataView];
        
        
        if (style==NotDataStyle_NotWork_Touch) {//添加屏幕事件
            
            self.userInteractionEnabled = YES;
            UILongPressGestureRecognizer *longPressUIemptyOverlay = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressUIemptyOverlay:)];
            [longPressUIemptyOverlay setMinimumPressDuration:0.001];
            [self addGestureRecognizer:longPressUIemptyOverlay];
            self.userInteractionEnabled = YES;

        }
        
        
        
    }
    return self;
}


#pragma mark -样式

-(void)setup:(NotDataStyle)style {
    
    if (style== NotDataStyle_NotWork_Click) {//没有网络 ,点击事件
        
        [self imageUrl:@"no-wifi" title:JSLocalizedString(@"There is no network", nil) detailTitle:JSLocalizedString(@"Don't give up -check the speling,or", nil) detailMultipleLable:JSLocalizedString(@"try less specifick search terms", nil)  reloadButtonTitle:JSLocalizedString(@"Reload", nil)];
        
    }
    else if (style== NotDataStyle_NotWork_Touch) {//没有网络 ,touch事件
        
        [self imageUrl:@"WebView_LoadFail_Refresh_Icon" title:JSLocalizedString(@"There is no data,please touch to reload", nil) detailTitle:@"" detailMultipleLable:@"" reloadButtonTitle:@""];
        
        
    }
    
   else if (style== NotDataStyle_Search) {//搜索
       
       [self imageUrl:@"hanger_pic" title:JSLocalizedString(@"Oh no ! Nothing matche Cost", nil) detailTitle:JSLocalizedString(@"Don't give up -check the speling , or try less ", nil) detailMultipleLable:JSLocalizedString(@"specifick search terms", nil) reloadButtonTitle:@""];
        
    
    }
    else if (style==NotDataStyle_Car){//购物车
      [self imageUrl:@"cart_pic" title:JSLocalizedString(@"Your cart is empty", nil) detailTitle:JSLocalizedString(@"Get started with options below ", nil) detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Go shopping", nil)];
    }
    else if (style==NotDataStyle_WishList){//收藏夹
      [self imageUrl:@"wishlist_pic" title:JSLocalizedString(@"No more item in your wishlist", nil) detailTitle:JSLocalizedString(@"Get started with options below", nil) detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Go shopping", nil)];
        
    }else if (style == NotDataStyle_AddressList){//地址列表
        [self imageUrl:@"blank_address" title:JSLocalizedString(@"You don't have any address", nil) detailTitle:JSLocalizedString(@"", nil) detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Add New Address", nil)];
    }else if (style == NotDataStyle_OrderList){//订单列表
        [self imageUrl:@"no orders" title:JSLocalizedString(@"You have no order history yet", nil) detailTitle:JSLocalizedString(@"", nil) detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Go shopping", nil)];
    }else if (style == NotDataStyle_ProductList){//商品列表
        [self imageUrl:@"hanger_pic" title:JSLocalizedString(@"Oh,no!Nothing match", nil) detailTitle:JSLocalizedString(@"Don't give up - check the spelling,or try less specific search terms", nil) detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Go shopping", nil)];
    }else if (style == NotDataStyle_CouponList){//优惠券列表(个人中心)
        [self imageUrl:@"no coupon" title:JSLocalizedString(@"Sorry,there is no coupon", nil) detailTitle:@"" detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Go shopping", nil)];
    }else if (style == NotDataStyle_WalletList){//钱包(个人中心)
        [self imageUrl:@"wallet_pic" title:JSLocalizedString(@"Your wallet is empty", nil) detailTitle:@"" detailMultipleLable:nil reloadButtonTitle:@""];
    }else if (style == NotDataStyle_PointList){//钱包(个人中心)
        [self imageUrl:@"points_pic" title:JSLocalizedString(@"Your point is empty", nil) detailTitle:@"" detailMultipleLable:nil reloadButtonTitle:@""];
    }else if (style == NotDataStyle_Error){//请求错误
        [self imageUrl:@"hanger_pic" title:JSLocalizedString(@"Sorry. Server error.", nil) detailTitle:JSLocalizedString(@"Please try again later.", nil) detailMultipleLable:nil reloadButtonTitle:JSLocalizedString(@"Reload", nil)];
    }
    
}




#pragma mark -赋值

-(void)imageUrl:(NSString *)imageUrl title:(NSString *)title detailTitle:(NSString *)detailTitle  detailMultipleLable:(NSString *)detailMultipleLable  reloadButtonTitle:(NSString *)reloadButtonTitle{
    
    //图片
    notDataView.imageView.image=[UIImage imageNamed:imageUrl];
    //标题
    notDataView.titleLabel.text=title;
    //详情
    notDataView.detailLable.text=detailTitle;
    
    notDataView.detailMultipleLable.text=detailMultipleLable;
 
    //按钮名
    [notDataView.reloadButton setTitle:reloadButtonTitle forState:UIControlStateNormal];
    
    if (self.style==NotDataStyle_NotWork_Touch) {//隐藏按钮
        notDataView.reloadButton.hidden=YES;
    }
    else{
         notDataView.reloadButton.hidden=NO;
    }

    
}








#pragma mark -触屏事件

- (void)longPressUIemptyOverlay:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        notDataView.imageView.alpha = 0.4;
    }
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
         notDataView.imageView.alpha = 1;
        [self.delegate resume:self style:self.style];
      
    }
}



#pragma mark -代理方法
-(void)reloadButtonClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(resume:style:)]) {
        [self.delegate resume:self style:self.style];
        if (self.style==NotDataStyle_NotWork_Click){
            [self removeFromSuperview];

        }
        
    }
    
  
    
}


#pragma mark -字符处理

-(void)transform:(NSString *)str{
    
    
}



@end
