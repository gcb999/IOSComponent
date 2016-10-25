//
//  DLNetWoring.m
//  DealSale
//
//  Created by gcb999 on 15/8/6.
//  Copyright (c) 2015年 com.sailvan.dealsale. All rights reserved.
//

#import "JSNetWork.h"




@interface JSNetWork(){

}


@end

@implementation JSNetWork


#pragma mark - LifeCycle

+(JSNetWork *)shareInstance{
    
    static JSNetWork *network=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network=[[self alloc] init];
    });
    return network;
}






#pragma mark--请求成功

-(BOOL)isConnectNetWork{
   __block BOOL isExistenceNetwork = YES;
    
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 设置网络状态改变之后的操作
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // status :当前的网络状态.
        //        AFNetworkReachabilityStatusUnknown
        //        AFNetworkReachabilityStatusNotReachable
        //        AFNetworkReachabilityStatusReachableViaWWAN
        //        AFNetworkReachabilityStatusReachableViaWiFi
        
        if (status==AFNetworkReachabilityStatusUnknown) {
            
            NSLog(@"未知的网络状态");
            
            isExistenceNetwork= YES;
            
        }
        else if (status==AFNetworkReachabilityStatusNotReachable) {
            
           NSLog(@"没有网络");
            isExistenceNetwork= NO;
        }
        else if ( status==AFNetworkReachabilityStatusReachableViaWWAN){
            NSLog(@"蜂窝移动网络");
            isExistenceNetwork=YES;
            
        }
        else if (status==AFNetworkReachabilityStatusReachableViaWiFi){
            NSLog(@"WIFI网络");
            isExistenceNetwork=YES;
            
        }


        
    }];
   
    // 开始检测网络状态
    [manager startMonitoring];
    
    
    return isExistenceNetwork;
}


@end
