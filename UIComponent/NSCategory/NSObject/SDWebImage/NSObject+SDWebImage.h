//
//  NSObject+SDWebImage.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"


typedef void(^JSSDWebImageCompletionBlock)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL);

@interface NSObject (SDWebImage)




/*
 imageview:  图片控件
 
 URL : 图片URL
 
 placeholderImageName; 预加载图片
 
 failedImageName：图片加载失败
 
 */


//动图
-(void)loadingScaleImageview:(UIImageView *)imageview url:(NSString *)url placeholderImageName:(NSString *)placeholderImageName failedImageName:(NSString *)failedImageName completed:(JSSDWebImageCompletionBlock)completed;

//静图
-(void)loadingImageview:(UIImageView *)imageview url:(NSString *)url placeholderImageName:(NSString *)placeholderImageName failedImageName:(NSString *)failedImageName completed:(JSSDWebImageCompletionBlock)completed;




#pragma mark -加载信息图片,图片置灰
-(void)loadingGrayImageview:(UIImageView *)imageview url:(NSString *)url placeholderImageName:(NSString *)placeholderImageName failedImageName:(NSString *)failedImageName;

@end