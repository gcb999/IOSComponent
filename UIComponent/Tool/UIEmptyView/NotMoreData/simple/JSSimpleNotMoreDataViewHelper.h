//
//  JSSimpleNotMoreDataViewHelper.h
//  DressLink
//
//  Created by gcb999 on 16/6/28.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSSimpleNotMoreDataView.h"

typedef NS_ENUM(NSInteger, NotDataStyle) {
   
    NotDataStyle_None=0,
    NotDataStyle_NotWork_Click=1,//没有网络,click按钮
    NotDataStyle_NotWork_Touch=2,//没有网络,touch屏幕
    NotDataStyle_Search=3,//搜索
    NotDataStyle_Car=4,//购物车
    NotDataStyle_WishList=5,//wishlist
    NotDataStyle_AddressList=6,//地址列表
    NotDataStyle_OrderList=7,//订单列表
    NotDataStyle_ProductList=8,//商品列表
    NotDataStyle_CouponList=9,//优惠券列表(个人中心)
    NotDataStyle_WalletList=10,//钱包(个人中心)
    NotDataStyle_PointList=11,//积分(个人中心)
    NotDataStyle_Error = 12,//请求错误
};


@protocol JSSimpleNotMoreDataViewHelperDelegate;




@interface JSSimpleNotMoreDataViewHelper : UIView



- (instancetype)initWithFrame:(CGRect)frame style:(NotDataStyle)style delegate:(id<JSSimpleNotMoreDataViewHelperDelegate>)delegate;



@end


//协议

@protocol  JSSimpleNotMoreDataViewHelperDelegate <NSObject>

//刷新数据
-(void)resume:(JSSimpleNotMoreDataViewHelper*)helper style:(NotDataStyle)style;

@end