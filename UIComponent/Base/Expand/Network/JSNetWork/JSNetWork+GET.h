//
//  DLNetWoring+GET.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/22.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork.h"

/*-------------支持HTTPS----------
 
 http://www.cnblogs.com/Jepson1218/p/5215667.html
 
 
 http://www.jianshu.com/p/4102b817ff2f
 
 
 */

@interface JSNetWork (GET)

#pragma mark -GET 请求


/*--
 
 1：  Url           请求Url
 
 2:   result           返回结果
 
 3：  activityView      指定View，并在View会自动加入提升
 
 用途： 发送GET请求
 
 */

-(void)get:(NSString *)url  result: (void(^)(BOOL isSuccess , NSDictionary *backDic,JSError *error))result;


-(void)get:(NSString *)url ActivityView:(UIView *)activityView  result: (void(^)(BOOL isSuccess , NSDictionary *backDic,JSError *error))result;


@end
