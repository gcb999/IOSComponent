//
//  JSTableViewDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSTableView;

@protocol JSTableViewDelegate <NSObject>

// 网络加载
-(void)JSTableView:(JSTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage;



@end