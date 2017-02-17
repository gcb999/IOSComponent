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

#pragma mark -是否第一次进入程序

+(BOOL)isFirstEnterApp;


@end
