//
//  secondCtrl.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "secondCtrl.h"
#import "JSSwipeTableCell.h"

@implementation secondCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self groupTableviwe];
    
}

#pragma mark -tableview

-(void)groupTableviwe{
    JSGroupTableView *tableview=[[JSGroupTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped state:JSTableViewHeaderFooter cellClass:[JSSwipeTableCell class] delegate:self];
    
    
    NSMutableArray *rights=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSString *title=[NSString stringWithFormat:@"test%d",i];
        JSSwipeTableCellModel *model=[[JSSwipeTableCellModel alloc] initWithTitle:title color:[UIColor redColor] icon:@""];
        [rights addObject:model];
    }
    NSString *key=[NSString stringWithFormat:@"%d",1];
    NSMutableArray *temps=[NSMutableArray array];
    for (int i=0; i<2; i++) {
        NSString *str=[NSString stringWithFormat:@"--%d",i];
        [temps addObject:str];
    }
    [tableview.sections addObject:key];
    [tableview.rowsOfSectionDic addEntriesFromDictionary:@{key:temps}];
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



@end
