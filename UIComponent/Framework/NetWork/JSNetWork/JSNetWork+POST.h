//
//  DLNetWoring+POST.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 16/3/22.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork.h"

@interface JSNetWork (POST)

/*--
 
 1：   Url           请求Url
 
 2:   result           返回结果
 
 3：  activityView      指定View，并在View会自动加入提升
 
 用途： 发送POST请求
 
 */



-(void)post:(NSString *)url postBody:(NSDictionary *)postBody result:(void(^)(BOOL isSuccess , NSDictionary *backDic,JSError *error))result;

-(void)post:(NSString *)url postBody:(NSDictionary *)postBody   ActivityView:(UIView *)activityView result:(void(^)(BOOL isSuccess , NSDictionary *backDic,JSError *error))result;
@end
