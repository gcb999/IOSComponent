//
//  UIImage+imageNamed_bundle_.h
//  ios_assets_hot_update_2
//
//  Created by 颜风 on 2016/9/23.
//  Copyright © 2016年 iOS122. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (imageNamed_bundle_)


#pragma mark -加载图片
+ (UIImage *)yf_imageNamed:(NSString *)imgName;/* load img smart .*/


#pragma mark -重置
+ (void )yf_reset:(void (^)(BOOL success, NSError * error))completionHandler;


@end
