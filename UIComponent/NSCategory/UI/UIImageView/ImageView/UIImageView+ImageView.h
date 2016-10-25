//
//  UIImageView+ImageView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageView)


#pragma mark -图片展示

+ (UIImageView *)imageViewImageName:(NSString*)aImageName frame:(CGRect)aRect;


#pragma mark -图片拉伸

+ (UIImageView *)resizableImageViewImageName:(NSString*)aImageName frame:(CGRect)aRect;

@end
