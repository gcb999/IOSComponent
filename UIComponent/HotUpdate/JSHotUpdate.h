//
//  JSHotUpdate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 参考文章 ：https://github.com/ios122/ios_assets_hot_update
 
 1： 先更新
 
 2： 优先图片网络下载(缓存Bundle)，后面读取本地Bundle
 
 */
@interface JSHotUpdate : NSObject

-(void)updateCompletion: (void(^)(BOOL isSuccess , NSDictionary *backDic,NSError *error))completion;

@end
