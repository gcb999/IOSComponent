
//
//  HomeView.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/20.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "HomeView.h"
#import "JSTableView.h"

@interface HomeView()<JSTableViewDelegate,JSTableViewCellDelegate>
{

    
}


@property(nonatomic,strong)JSTableView *tableView;

@end

@implementation HomeView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
    
        [self addSubview:self.tableView];
    
    
    }
    
    return self;
}


#pragma mark-代理方法

/*

1: 第一次加载传递数据
 
 
 2：第二次数据刷新
 
 
 
 */


-(void)reload:(NSArray *)arr{
    if (IS_NSArray(arr)) {
            [self.tableView.dataArray removeAllObjects];
            [self.tableView.dataArray addObjectsFromArray:arr];
            [self.tableView reloadData];
    }
    

}


#pragma mark -getter 方法

-(JSTableView *)tableView{
    
    if (!_tableView) {
            _tableView=[[JSTableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain state:JSTableViewNormal cellClass:[UITableViewCell class] delegate:self];
    }
    return _tableView;
    
}



@end
