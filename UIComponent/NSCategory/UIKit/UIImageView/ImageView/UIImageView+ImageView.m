//
//  UIImageView+ImageView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/25.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "UIImageView+ImageView.h"

@implementation UIImageView (ImageView)


#pragma mark -图片展示

+ (UIImageView *)imageViewImageName:(NSString*)aImageName frame:(CGRect)aRect{
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:aRect];
    
    imageView.userInteractionEnabled = YES;
    if(aImageName ==nil || [aImageName isEqualToString:@""] || aImageName.length==0){
        
        return imageView;
    }
    else{
        
        UIImage *aImage =[UIImage imageNamed:aImageName];
        if (aImage==nil) {
            aImage=[UIImage imageWithContentsOfFile:BUNDLE_PATH_IMAGENAME(aImageName)];;
        }
        
    }
    return imageView;
}




#pragma mark -图片拉伸

+ (UIImageView *)resizableImageViewImageName:(NSString*)aImageName frame:(CGRect)aRect{
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:aRect];
    
    imageView.userInteractionEnabled = YES;
    if(aImageName ==nil || [aImageName isEqualToString:@""] || aImageName.length==0){
        
        return imageView;
    }
    else{
        
        UIImage *aImage =[UIImage imageNamed:aImageName];
        if (aImage==nil) {
            
            aImage=[UIImage imageWithContentsOfFile:BUNDLE_PATH_IMAGENAME(aImageName)];;
        }
        
        if ([aImage respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
            imageView.image = [aImage resizableImageWithCapInsets:UIEdgeInsetsMake(aImage.size.height/2, aImage.size.width/2, aImage.size.height/2, aImage.size.width/2)];
        } else {
            imageView.image = [aImage stretchableImageWithLeftCapWidth:aImage.size.width/2 topCapHeight:aImage.size.height/2];
        }
        
    }
    return imageView;
}



@end
