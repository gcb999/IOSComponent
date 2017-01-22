//
//  UIImageView+SDWebImage.h
//  IOS_Compon
//
//  Created by gcb999 on 17/1/22.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"


typedef void(^SDWebImageCategoryCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);

@interface UIImageView (SDWebImage)


#pragma mark -Scale动图

-(void)sdScale_setImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage;

#pragma mark -静态图

-(void)sdNoraml_setNormalImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage;


#pragma mark -灰图
-(void)sdGray_setNormalImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage;

@end
