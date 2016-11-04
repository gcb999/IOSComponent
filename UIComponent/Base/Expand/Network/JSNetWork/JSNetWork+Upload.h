//
//  JSNetWork+Upload.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/3.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork.h"

@interface JSNetWork (Upload)

-(void)upload:(NSString *)url postBody:(NSDictionary *)postBody  progress:(void (^)(NSProgress *downloadProgress,CGFloat currentProgress))currentProgress  completionHandler:(void(^)(BOOL isSuccess , id responseObject,NSError *error))completionHandler;

@end
