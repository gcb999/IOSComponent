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
#import "JSTableView.h"




@interface MainViewController ()<JSTableViewDelegate,JSGroupTableViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self groupTableviwe];


}

#pragma mark -tableview

-(void)groupTableviwe{
    JSGroupTableView *tableview=[[JSGroupTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain state:JSTableViewHeaderFooter cellClass:[JSSwipeTableCell class] delegate:self];

    
    NSMutableArray *rights=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        JSSwipeTableCellModel *model=[[JSSwipeTableCellModel alloc] initWithTitle:title color:[UIColor redColor] icon:@""];
        [rights addObject:model];
    }
    tableview.rightSwipeModel=rights;
    
    
    [self.view addSubview:tableview];
    
}

-(void)JSGroupTableView:(JSGroupTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage{
    
    if (currentPage==1) {
        [tableview.sections removeAllObjects];
        [tableview.rowsOfSectionDic removeAllObjects];
        
        //section
        NSString *key=[NSString stringWithFormat:@"%d",currentPage];
        NSMutableArray *temps=[NSMutableArray array];
        for (int i=0; i<2; i++) {
            NSString *str=[NSString stringWithFormat:@"--%d",i];
            [temps addObject:str];
        }
        [tableview.sections addObject:key];
        [tableview.rowsOfSectionDic addEntriesFromDictionary:@{key:temps}];
        [tableview reloadHeader];
        
    }
    else{
   
        NSString *key=[NSString stringWithFormat:@"%d",currentPage];
        NSMutableArray *temps=[NSMutableArray array];
        for (int i=0; i<2; i++) {
            NSString *str=[NSString stringWithFormat:@"--%d",i];
            [temps addObject:str];
        }
        [tableview.sections addObject:key];
        [tableview.rowsOfSectionDic addEntriesFromDictionary:@{key:temps}];
        [tableview reloadFooter];
    }
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
