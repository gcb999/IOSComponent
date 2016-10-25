//
//  NSObject+SDWebImage.m
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/23.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "NSObject+SDWebImage.h"
#import "UIView+AnimationProperty.h"


@implementation NSObject (SDWebImage)



    
#pragma mark -Banner

//动图
-(void)loadingScaleImageview:(UIImageView *)imageview url:(NSString *)url placeholderImageName:(NSString *)placeholderImageName failedImageName:(NSString *)failedImageName{
    
    if ([url hasPrefix:@"http"]){
        
        //        [imageview setShowActivityIndicatorView:true];
        [imageview setIndicatorStyle:UIActivityIndicatorViewStyleGray];
        __weak UIImageView  *wself = imageview;
        [imageview sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderImageName] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                if (IS_NSString(failedImageName)) {
                      wself.image=[UIImage imageNamed:failedImageName];
                }
              
            }
            else{
                    wself.image = image;
                    wself.alpha = 0;
                    wself.scale = 1.1f;

                    [UIView animateWithDuration:0.5f animations:^{

                        wself.alpha = 1.f;
                        wself.scale = 1.f;
                    }];
            }
        }];
        
    }
    else{
        if (IS_NSString(failedImageName)) {
            imageview.image=[UIImage imageNamed:failedImageName];
        }

    }

    
}
//静图
-(void)loadingImageview:(UIImageView *)imageview url:(NSString *)url placeholderImageName:(NSString *)placeholderImageName failedImageName:(NSString *)failedImageName{
    if ([url hasPrefix:@"http"]){
        
        //        [imageview setShowActivityIndicatorView:true];
        [imageview setIndicatorStyle:UIActivityIndicatorViewStyleGray];
        __weak UIImageView  *wself = imageview;
        [imageview sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholderImageName] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                if (IS_NSString(failedImageName)) {
                    wself.image=[UIImage imageNamed:failedImageName];
                }
                
            }
            else{
                 wself.image = image;
            }
        }];
        
    }
    else{
        if (IS_NSString(failedImageName)) {
            imageview.image=[UIImage imageNamed:failedImageName];
        }
        
    }

    
}









#pragma mark -加载信息图片,图片置灰

-(void)loadingGrayImageName:(NSString *)imageName imgview:(UIImageView *)imgview{
    
    
    if ([imageName hasPrefix:@"http"]){
        
//        [imgview setShowActivityIndicatorView:true];
        [imgview setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        //商品图片
        __weak UIImageView  *wself = imgview;
        [imgview sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"Cart_failed_to_load_pic"] options:SDWebImageRetryFailed|SDWebImageLowPriority completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error) {
                wself.image=[UIImage imageNamed:KNotWorkImagview];
            }
            else{//成功
                wself.image = [self grayImage:image];
                wself.alpha = 0;
                wself.scale = 1.1f;
                
                [UIView animateWithDuration:0.5f animations:^{
                    
                    wself.alpha = 1.f;
                    wself.scale = 1.f;
                }];
            }
        }];
        
    }
    else{
        imgview.image=[UIImage imageNamed:imageName];
    }
    
    
}

-(UIImage *)grayImage:(UIImage *)sourceImage
{
    int bitmapInfo = kCGImageAlphaNone;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}



@end
