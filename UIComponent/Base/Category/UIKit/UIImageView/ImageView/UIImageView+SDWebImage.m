//
//  UIImageView+SDWebImage.m
//  IOS_Compon
//
//  Created by gcb999 on 17/1/22.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)


#pragma mark -Scale动图

-(void)sdScale_setImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage{
    
    __weak UIImageView  *wself = self;
    
    [self sdwebimage_setImageWithURL:url placeholderImage:placeholder failedImage:failedImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!error) {
           
            
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


#pragma mark -静态图

-(void)sdNoraml_setNormalImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage{
    
    
    [self sdwebimage_setImageWithURL:url placeholderImage:placeholder failedImage:failedImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!error) {
            
 
            
        }
        
    }];
}

#pragma mark -灰图
-(void)sdGray_setNormalImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage{
    
    __weak UIImageView  *wself = self;
    
    [self sdwebimage_setImageWithURL:url placeholderImage:placeholder failedImage:failedImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!error) {
            
             wself.image = [self grayImage:image];
            
        }
        
    }];
}



#pragma mark -图片加载方法
-(void)sdwebimage_setImageWithURL:(NSString *)url placeholderImage:(NSString *)placeholder failedImage:(NSString *)failedImage  completed:(SDWebImageCategoryCompletionBlock)completed{

    [self setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    SDWebImageOptions options=SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageAllowInvalidSSLCertificates;
    
    if ([[url lowercaseString] hasPrefix:@"http:"]) {
        options= SDWebImageRetryFailed|SDWebImageLowPriority;
    }
    if ([[url lowercaseString] hasPrefix:@"https:"]) {
        options= SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageAllowInvalidSSLCertificates;
    }
    
     __weak UIImageView  *wself = self;
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder] options:options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        if(error){
          
            if (IS_NSString(failedImage)) {
                wself.image=[UIImage imageNamed:failedImage];
            }
            
        }
        else{
           
            completed(image,error,cacheType,imageURL);
      
        }
        
        
        
    }];

    
}


#pragma mark -图片加灰色
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
