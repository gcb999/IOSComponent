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
 http://www.ios122.com/
 1： 先更新
 
 2： 优先图片网络下载(缓存Bundle)，后面读取本地Bundle
 
 */
@interface JSHotUpdate : NSObject

-(void)updateCompletion: (void(^)(BOOL isSuccess , NSDictionary *backDic,NSError *error))completion;

@end


/*---------------------------

JSHotUpdate *update=[[JSHotUpdate alloc] init];
[update updateCompletion:^(BOOL isSuccess, NSDictionary *backDic, NSError *error) {
    UIImage * image = [UIImage yf_imageNamed:@"sub/sample"];
    imageView.image = image;
}];;
 
 
 1: 同样在线上放一份同目录的Bundle资源（相同资源名称，只是内容不同）
 
 A: 通过版本号或Md5进行校验 ，是否下载线上bundle资源，
 
 如果相同，则不更新
 
 如果不相同：则更新，放入沙盒缓存中去
 
 B: 其中我们在读取图片的优先级：沙盒缓存> IPa中内容
 
 如果沙盒中有图片，则不读取IPa中图片
 
 如果沙盒中没有图片，则读取IPA中图片
 
 技术点：
 
 就是版本号(md5)的比对与存储
 
 A: 只有资源包完全下载成功就更新版本号
 
 B：下载资源采用的断点下载

 ---------------------------*/
