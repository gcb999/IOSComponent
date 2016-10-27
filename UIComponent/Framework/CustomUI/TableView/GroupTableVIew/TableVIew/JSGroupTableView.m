//
//  JSGroupTableView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSGroupTableView.h"


@interface JSGroupTableView ()
{
    
}

@property(nonatomic,assign)JSTableViewState state;

@end


@implementation JSGroupTableView


-(instancetype)initWithFrame:(CGRect)rect style:(UITableViewStyle)style state:(JSTableViewState)state cellClass:(Class) cellClass delegate:(id<JSGroupTableViewDelegate>)delegate{
    
    
    if (self=[super initWithFrame:rect style:style]) {
        
        self.state=state;
        
        self.sections=[NSMutableArray array];
        self.rowsOfSectionDic=[NSMutableDictionary dictionary];
        
        
        self.groupTableViewDelegate=delegate;
        
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
