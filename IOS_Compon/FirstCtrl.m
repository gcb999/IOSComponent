//
//  FirstCtrl.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "FirstCtrl.h"
#import "JSSwipeTableCell.h"

@implementation FirstCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableviwe];
    
}


#pragma mark -tableview

-(void)tableviwe{
    JSTableView *tableview=[[JSTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain state:JSTableViewHeaderFooter cellClass:[JSSwipeTableCell class] delegate:self];
    [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
    
    
    

    
    NSMutableArray *rights=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        JSSwipeTableCellModel *model=[[JSSwipeTableCellModel alloc] initWithTitle:title color:[UIColor redColor] icon:@""];
        [rights addObject:model];
    }
    tableview.rightSwipeModel=rights;
    
    [self.view addSubview:tableview];
    
    
//    tableview.yz_headerScaleImage = [UIImage imageNamed:@"header"];
//    
//    // 设置tableView头部视图，必须设置头部视图背景颜色为clearColor,否则会被挡住
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
//    // 清空头部视图背景颜色
//    headerView.backgroundColor = [UIColor clearColor];
//    tableview.tableHeaderView = headerView;
//  
    
}

-(void)JSTableView:(JSTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage{
    
    //    JSGroupTableView *table
    if (currentPage==1) {
        [tableview.dataArray removeAllObjects];
        [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
        NSLog(@"---%@",tableview.dataArray);
        [tableview reloadHeader];
    }
    else{
        [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
        NSLog(@"---%@",tableview.dataArray);
        [tableview reloadFooter];
    }
    
    
    
}

@end
