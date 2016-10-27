//
//  JSGroupTableViewDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JSGroupTableView;

@protocol JSGroupTableViewDelegate <NSObject>

// 网络加载
-(void)JSGroupTableView:(JSGroupTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage;


//侧滑按钮点击
-(BOOL)JSGroupTableView:(JSGroupTableView *)tableview  swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion;


//重新定义Cell（分组）
-(UITableViewCell *)JSGroupTableView:(JSTableView *)JSGroupTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
