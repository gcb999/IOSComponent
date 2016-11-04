//
//  UIImageView+Gif.m
//  DressLink
//
//  Created by gcb999 on 16/6/17.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "UIImageView+Gif.h"
#import "FLAnimatedImage.h"

@implementation UIImageView (Gif)


+(UIImageView *)imageViewImageName:(CGRect)frame gifName:(NSString *)gifName{
    
    NSData *data;
    FLAnimatedImage *image;
    if ([[gifName lowercaseString] hasSuffix:@"http"]) {//读取网络网络
        
        NSURL *URL=[NSURL URLWithString:gifName];
        data=[NSData dataWithContentsOfURL:URL];
        image = [FLAnimatedImage animatedImageWithGIFData:data];
        
    }
    else{//读取本地gif
        
        NSString *path=BUNDLE_PATH_IMAGENAME(gifName);
        data=[NSData dataWithContentsOfFile:path];
        image = [FLAnimatedImage animatedImageWithGIFData:data];
        
    }
    
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    imageView.frame = frame;
    return imageView;
    
}



@end
