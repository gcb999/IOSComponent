//
//  JSHotUpdate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/2.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSHotUpdate : NSObject

-(void)updateCompletion: (void(^)(BOOL isSuccess , NSDictionary *backDic,NSError *error))completion;

@end
