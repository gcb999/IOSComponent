//
//  JSRefresh+TableView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSRefresh+TableView.h"

@implementation JSRefresh (TableView)

-(void)setUpMJRefresh:(JSTableViewState) state tableView:(JSTableView *)tableView{
    
    if (state==JSTableViewNormal) {
        
        
    }
    else if (state==JSTableViewHeader)//只显示头部
    {
        [self setUpMJTableviewHeder:tableView];
        
    }
    else if (state==JSTableViewFooter){//只显示尾部
        
        [self setUpMJtableviewFooter:tableView];
    }
    else if (state==JSTableViewHeaderFooter){
        
        [self setUpMJTableviewHeder:tableView];
        [self setUpMJtableviewFooter:tableView];
    }
    
}








#pragma mark -添加头部
-(void)setUpMJTableviewHeder:(JSTableView *)tableview
{
    
//    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:tableview refreshingAction:@selector(loadNewData)];
    JSRefreshAutoGifHeader *header=[JSRefreshAutoGifHeader headerWithRefreshingTarget:tableview refreshingAction:@selector(loadNewData)];
    // 设置文字
    [header setTitle:JSLocalizedString(@"Pull down to refresh", nil) forState:MJRefreshStateIdle];
    [header setTitle:JSLocalizedString(@"Release to refresh", nil) forState:MJRefreshStatePulling];
    [header setTitle:JSLocalizedString(@"Loading ...", nil) forState:MJRefreshStateRefreshing];
    
    
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    //
    //    // 隐藏状态
    //    //    header.stateLabel.hidden = YES;
    //
    //
    // 设置字体
    header.stateLabel.font = KNormalFontSize;
    header.lastUpdatedTimeLabel.font = KNormalFontSize;
    
    // 设置颜色
    header.stateLabel.textColor = KCOLOR_BLACK;
    header.lastUpdatedTimeLabel.textColor = KCOLOR_BLACK;
    
    // 设置刷新控件
    tableview.mj_header = header;
    
    
}

#pragma mark -添加尾部
-(void)setUpMJtableviewFooter:(JSTableView *)tableview
{
    
    
    //        [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    // 添加默认的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:tableview refreshingAction:@selector(loadMoreData)];
     JSRefreshAutoGifFooter *footer=[JSRefreshAutoGifFooter footerWithRefreshingTarget:tableview refreshingAction:@selector(loadMoreData)];
    // 设置文字
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:JSLocalizedString(@"Loading more ...", nil) forState:MJRefreshStateRefreshing];
    [footer setTitle:JSLocalizedString(@"No more data", nil) forState:MJRefreshStateNoMoreData];
    // 设置字体
    footer.stateLabel.font = KNormalFontSize;
    
    // 设置颜色
    footer.stateLabel.textColor = KCOLOR_BLACK;
    
    // 设置footer
    tableview.mj_footer = footer;
    //
}


@end
