//
//  JSRatingBar.h
//  DressLink
//
//  Created by hjl on 16/6/30.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCSStarRatingView.h"


//参考文章：https://github.com/hsousa/HCSStarRatingView

@protocol JSRatingViewDelegate;

@interface JSRatingView : HCSStarRatingView


- (instancetype)initWithFrame:(CGRect)frame  emptyStarImage:(NSString *)emptyStarImage halfStarImage:(NSString *)halfStarImage filledStarImage:(NSString *)filledStarImage andDelegate:(id<JSRatingViewDelegate>)delegate;


@end


@protocol JSRatingViewDelegate <NSObject>

/**
 *  评分改变
 *
 *  @param ratingBar 评分控件
 *  @param newRating 评分值
 */
- (void)JSRatingView:(JSRatingView *)ratingBar ratingChanged:(float)newRating;



@end



/*------------------------------用法---------------------
JSRatingView * ratingView = [[JSRatingView alloc]initWithFrame:CGRectMake(0, 20, 200, 100) emptyStarImage:@"big_empty_star_icon" halfStarImage:@"big_half_star_icon" filledStarImage:@"big_star_icon" andDelegate:self];
ratingView.value=3;


ratingView.userInteractionEnabled=NO;//显示  YES 是可以打分，NO是显示粉丝


[self.view addSubview:ratingView];
 
 
 ------------------------------*/
