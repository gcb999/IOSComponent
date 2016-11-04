//
//  JSFmdb.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface JSFmdb : NSObject

+(instancetype) shareInstance;


/**
 *  具有线程安全的数据队列
 */
@property (nonatomic,strong) FMDatabaseQueue *queue;


@end
