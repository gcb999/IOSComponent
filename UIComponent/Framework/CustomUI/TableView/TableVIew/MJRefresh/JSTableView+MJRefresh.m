//
//  JSTableView+MJRefresh.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView+MJRefresh.h"
#import "JSRefresh+TableView.h"


@implementation JSTableView (MJRefresh)

#pragma mark ----------------------初始化MJ 头部、底部----------------------------------------


-(void)setUpMJRefresh:(JSTableViewState) state{
    
    [[JSRefresh shareInstance] setUpMJRefresh:state tableView:self];
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



-(void)reloadHeader{
    
    
    [self.mj_header endRefreshing];
    [self reloadData];
    
}


-(void)reloadFooter{
    
    
    [self.mj_footer endRefreshing];
    [self reloadData];
    
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
