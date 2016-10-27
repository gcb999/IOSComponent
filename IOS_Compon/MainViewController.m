//
//  MainViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "MainViewController.h"
#import "JSSwipeTableCell.h"
#import "JSGroupTableView.h"




@interface MainViewController ()<JSTableViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JSGroupTableView *tableview=[[JSGroupTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain state:JSTableViewHeaderFooter cellClass:[JSSwipeTableCell class] delegate:self];
     [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
    
    NSMutableArray *rights=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        JSSwipeTableCellModel *model=[[JSSwipeTableCellModel alloc] initWithTitle:title color:[UIColor redColor] icon:@""];
        [rights addObject:model];
    }
    tableview.rightSwipeModel=rights;
    
    
    [self.view addSubview:tableview];

}

-(void)JSTableView:(JSTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage{
 
//    JSGroupTableView *table
//    [tableview.dataArray addObjectsFromArray:@[@"11",@"12"]];
//    NSLog(@"---%@",tableview.dataArray);
//    [tableview reloadHeader];

    
}

@end
