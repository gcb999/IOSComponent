//
//  JSTableView+MJRefresh.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView.h"
#import "MJRefresh.h"

@interface JSTableView (MJRefresh)





#pragma mark ----------------------TableView 刷新方法----------------------------------------
-(void)reloadData;

-(void)reloadHeader;

-(void)reloadFooter;

#pragma mark ----------------------TableView 隐藏与显示方法----------------------------------------

-(void)hiddenFooter;

-(void)showFooter;


@end
