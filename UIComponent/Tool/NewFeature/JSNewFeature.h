//
//  JSNewFeature.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/4.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSNewFeature : NSObject



#pragma mark -展示新特性页面（第一次进入） 放在[self.window makeKeyAndVisible]; 后面
+(void)showNewFeature;


#pragma mark -展示页面动画(第二次进入）主控制器中 ViewDidLoad中

+(void)showLaunchAnimation;



@end
