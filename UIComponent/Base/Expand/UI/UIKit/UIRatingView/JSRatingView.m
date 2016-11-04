//
//  JSRatingBar.m
//  DressLink
//
//  Created by hjl on 16/6/30.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "JSRatingView.h"

@interface JSRatingView (){

}




@property (nonatomic , weak) id<JSRatingViewDelegate>  delegate;

@end

@implementation JSRatingView


- (instancetype)initWithFrame:(CGRect)frame  emptyStarImage:(NSString *)emptyStarImage halfStarImage:(NSString *)halfStarImage filledStarImage:(NSString *)filledStarImage andDelegate:(id<JSRatingViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.delegate=delegate;
        
        self.maximumValue = 5;//默认5
        
        self.minimumValue = 0;//默认0,不能选择比minimumValue小的星星值，当你没有选择星星时value也是minimumValue
        
        self.value = 0;//当前值，默认0
        
        
    #pragma mark -是否容许半星
        self.allowsHalfStars = YES;//是否允许半星，默认NO
        
        
        self.accurateHalfStars = YES;//是否是否允许精确选择 可以根据选择位置进行精确，默认NO
        
        //星星的颜色
//        self.tintColor = [UIColor colorWithRed:232/255.0 green:156/255.0 blue:39/255.0 alpha:1.0];//默认蓝色
        
      #pragma mark - 半星
        if(IS_NSString(halfStarImage)){
             self.halfStarImage = [UIImage imageNamed:halfStarImage]; // optional
        }
       
        
      #pragma mark -设置空星时的图片

        self.emptyStarImage = [UIImage imageNamed:emptyStarImage];
        
        
       #pragma mark -设置全星时的图片

        self.filledStarImage=[UIImage imageNamed:filledStarImage];

        [self addTarget:self action:@selector(didChange:) forControlEvents:UIControlEventValueChanged];
        

        
    }
    return self;
}

- (void)didChange:(HCSStarRatingView*)sender{
    //    NSLog(@"starView.value:%f",starView.value);
    if (self.delegate && [self.delegate respondsToSelector:@selector(JSRatingView:ratingChanged:)]) {
        [self.delegate JSRatingView:self ratingChanged:self.value];
    }
}



@end
