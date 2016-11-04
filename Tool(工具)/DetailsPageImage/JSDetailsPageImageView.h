//
//  JSDetailsPageImageView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/4.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"


@interface JSDetailsPageImageView : UIView



- (instancetype)initWithFrame:(CGRect)frame orignUrl:(NSString *)orignUrl;

@property(nonatomic,strong)NSArray *smallImgUrls;

@property(nonatomic,strong)NSArray *bigImgUrls;


@end

/*------------------------------用法-------------------
 
 
 -(JSDetailsPageImageView *)imageDetail{
 if (_imageDetail==nil) {
 _imageDetail=[[JSDetailsPageImageView alloc] initWithFrame:CGRectMake(0, 0, IPHONScreenWidth, 300) orignUrl: @"http://images.cnitblog.com/blog/215975/201405/311744526507841.png"];
 
 }
 return _imageDetail;
 }

 
 
 
 _imageDetail.smallImgUrls=model.bannerSmallUrls;
 _imageDetail.bigImgUrls=model.bannerBigUrls;
 
 */