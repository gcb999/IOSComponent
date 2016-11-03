//
//  DHLaunchAdPageHUD+Launch.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "DHLaunchAdPageHUD.h"

/*
参考文章  https://github.com/dingding3w/DHLaunchPageHUD
 
*/

@interface DHLaunchAdPageHUD (Launch)



@end



/*-----------------------用法-----------------------
NSString *adImageJPGUrl = @"http://p5.image.hiapk.com/uploads/allimg/150112/7730-150112143S3.jpg";
NSString *adimageGIFUrl = @"http://img.ui.cn/data/file/3/4/6/210643.gif";
NSString *adImageJPGPath = [[NSBundle mainBundle] pathForResource:@"adImage2" ofType:@"jpg"];
NSString *adImageGifPath = [[NSBundle mainBundle] pathForResource:@"adImage3" ofType:@"gif"];

DHLaunchAdPageHUD *launchAd = [[DHLaunchAdPageHUD alloc] initWithFrame:CGRectMake(0, 0, DDScreenW, DDScreenH-100) aDduration:6.0 aDImageUrl:adImageGifPath hideSkipButton:NO launchAdClickBlock:^{
    NSLog(@"[AppDelegate]:点了广告图片");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
}];

-----------------------用法-----------------------*/