//
//  JSTableView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView.h"


@interface JSTableView ()
{
    
}

@property(nonatomic,assign)JSTableViewState state;

@end


@implementation JSTableView

-(instancetype)initWithFrame:(CGRect)rect style:(UITableViewStyle)style state:(JSTableViewState)state cellClass:(Class) cellClass delegate:(id<JSTableViewDelegate>)delegate{
    
    
    if (self=[super initWithFrame:rect style:style]) {
    
        self.state=state;
      self.pageIndex=1;
        
        self.dataArray=[NSMutableArray array];
        

        self.tableViewDelegate=delegate;
        
        self.delegate = self;
        self.dataSource = self;
        
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        self.tableFooterView=v;
        
        if (cellClass) {
            [self registerClass:cellClass forCellReuseIdentifier:JSTableViewIdentifier];
        }
        
       //MJ
        [self setUpMJRefresh:state];
        
        
        
        

    }
    
    return self;
}







@end
