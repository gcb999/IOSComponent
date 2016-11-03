//
//  JSNetWork+Download.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSNetWork.h"

@interface JSNetWork (Download)

- (NSURLSessionDownloadTask *)download:(NSString *)url progress:(void (^)(NSProgress *downloadProgress,CGFloat currentProgress)) currentProgress completionHandler:(void (^)(NSURLResponse *response, NSURL *filePath, NSError *error))completionHandler;

@end
