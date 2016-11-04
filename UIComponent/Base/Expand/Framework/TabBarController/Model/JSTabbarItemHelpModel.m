//
//  JSTabbarItemHelpModel.m
//  kit
//
//  Created by gcb999 on 16/6/10.
//  Copyright © 2016年 com.sailvan.gcb999. All rights reserved.
//

#import "JSTabbarItemHelpModel.h"

@implementation JSTabbarItemHelpModel

@synthesize tabbarItemModels=_tabbarItemModels;


#pragma mark -配置数据源

-(NSArray *)dataSoures{
    
    return @[
             
             @{
                 @"title":@"首页",
                 
                 @"normal" : @"home_normal",
                 
                 @"highlighted" : @"home_highlight",
                 
                 @"ctrl":@"MainViewController"
                 },
             
             @{
                 @"title":@"分类页",
                 
                 @"normal" : @"home_normal",
                 
                 @"highlighted" : @"home_highlight",
                 
                 @"ctrl":@"LeftViewController"
                 },
             
             @{
                 @"title":@"购物车",
                 
                 @"normal" : @"home_normal",
                 
                 @"highlighted" : @"home_highlight",
                 
                 @"ctrl":@"MainViewController"
                 },
             
             @{
                 @"title":@"个人中心",
                 
                 @"normal" : @"home_normal",
                 
                 @"highlighted" : @"home_highlight",
                 
                 @"ctrl":@"LeftViewController"
                 }
             
             ];
    
}






-(NSArray<JSTabbarItemModel *> *)tabbarItemModels{
    if (_tabbarItemModels==nil) {
        
        NSMutableArray<JSTabbarItemModel *> *arr=[NSMutableArray array];
        NSArray *datas=[self dataSoures];
        for (NSDictionary * dic in datas) {
            JSTabbarItemModel *model = [JSTabbarItemModel objectWithKeyValues:dic];
            [arr addObject:model];
        }
        _tabbarItemModels=arr;
        
    }
    
    return _tabbarItemModels;
}



#pragma mark -单例类
static  JSTabbarItemHelpModel* _instance = nil;

+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [JSTabbarItemHelpModel shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [JSTabbarItemHelpModel shareInstance] ;
}



@end
