//
//  JSTableView+MJRefresh.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView+MJRefresh.h"

@implementation JSTableView (MJRefresh)

#pragma mark ----------------------初始化MJ 头部、底部----------------------------------------


-(void)setUpMJRefresh:(JSTableViewState) state{
    
    if (state==JSTableViewNormal) {
        
        
    }
    else if (state==JSTableViewHeader)//只显示头部
    {
        [self setUpMJHeder];
        
    }
    else if (state==JSTableViewFooter){//只显示尾部
        
        [self setUpMJFooter];
    }
    else if (state==JSTableViewHeaderFooter){
        
        [self setUpMJHeder];
        [self setUpMJFooter];
    }
    
}





#pragma mark -添加头部
-(void)setUpMJHeder
{
    
   MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 设置文字
    //    [header setTitle:JSLocalizedString(@"Pull down to refresh", nil) forState:MJRefreshStateIdle];
    //    [header setTitle:JSLocalizedString(@"Release to refresh", nil) forState:MJRefreshStatePulling];
    //    [header setTitle:JSLocalizedString(@"Loading ...", nil) forState:MJRefreshStateRefreshing];
    [header setTitle:JSLocalizedString(@"", nil) forState:MJRefreshStateIdle];
    [header setTitle:JSLocalizedString(@"", nil) forState:MJRefreshStatePulling];
    [header setTitle:JSLocalizedString(@"", nil) forState:MJRefreshStateRefreshing];
    
    
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
    self.mj_header = header;
    
    
}

#pragma mark -添加尾部
-(void)setUpMJFooter
{
    
    
    //        [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
    // 添加默认的上拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置文字
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:JSLocalizedString(@"Loading more ...", nil) forState:MJRefreshStateRefreshing];
    [footer setTitle:JSLocalizedString(@"No more data", nil) forState:MJRefreshStateNoMoreData];
    // 设置字体
    footer.stateLabel.font = KNormalFontSize;
    
    // 设置颜色
    footer.stateLabel.textColor = KCOLOR_BLACK;
    
    // 设置footer
    self.mj_footer = footer;
    //
}


#pragma mark -上拉刷新数据


-(void)loadNewData{
    
    
    self.pageIndex=1;
    //请求网络
    if(self.tableViewDelegate && [self.tableViewDelegate respondsToSelector:@selector(JSTableView:LoadRequestCurrentPage:)]){
        [self.tableViewDelegate JSTableView:self LoadRequestCurrentPage:self.pageIndex];
    }
    
    
    
}

#pragma mark -下拉更多数据

-(void)loadMoreData{
    
    self.pageIndex=self.pageIndex+1;
    //请求网络
    if(self.tableViewDelegate && [self.tableViewDelegate respondsToSelector:@selector(JSTableView:LoadRequestCurrentPage:)]){
        [self.tableViewDelegate JSTableView:self LoadRequestCurrentPage:self.pageIndex];
    }
}



#pragma mark ----------------------TableView 刷新方法----------------------------------------

-(void)reloadData{
    
    //    [self.tableView cyl_reloadData];
    [self reloadData];
    
    
}


-(void)reloadHeader{
    
    //    [self.tableView cyl_reloadData];
    [self reloadData];
    
    [self.mj_header endRefreshing];
    
}


-(void)reloadFooter{
    
    //    [self.tableView cyl_reloadData];
    [self reloadData];
    [self.mj_footer endRefreshing];
    
}

#pragma mark ----------------------TableView 隐藏与显示方法----------------------------------------
#pragma mark -隐藏头部
-(void)hiddenFooter{
    
    self.mj_footer.hidden=YES;
}


#pragma mark -添加头部
-(void)showFooter{
    
    //    [self TableViewFooter];
    self.mj_footer.hidden=NO;
}



@end
