//
//  MainViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "MainViewController.h"
#import "JSSwipeTableCell.h"
#import "JSCollectionViewCell.h"
#import "JSRatingView.h"



@interface MainViewController ()<JSTableViewDelegate,JSGroupTableViewDelegate,JSCollectionViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self collectioinView];



}

- (void)JSRatingView:(JSRatingView *)ratingBar ratingChanged:(float)newRating{
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     [[JSTabBarControllerConfig shareInstance] showBadgeOnItemIndex:0 badge:@"3" animation:YES];
}

#pragma mark -collectionView
-(void)collectioinView{
    
    JSCollectionViewWaterfallLayout *layount=[[JSCollectionViewWaterfallLayout alloc] init];
    layount.sectionInset=UIEdgeInsetsMake(2, 2, 2, 2);
    JSCollectionView *collectionView=[[JSCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layount delegate:self state:JSCollectionViewHeaderFooter cellClass:[JSCollectionViewCell class]];
       [collectionView.dataArray addObjectsFromArray:@[@"11",@"12"]];
    [self.view addSubview:collectionView];
    
}

-(CGSize)JSCollectionView:(JSCollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80, 80);
}

-(void)JSCollectionView:(JSCollectionView *)collectionView LoadRequestCurrentPage:(NSInteger)currentPage{
    if (currentPage==1) {
        [collectionView.dataArray removeAllObjects];
        [collectionView.dataArray addObjectsFromArray:@[@"11",@"12"]];
    
        [collectionView reloadHeader];
    }
    else{
        [collectionView.dataArray addObjectsFromArray:@[@"11",@"12"]];
        [collectionView reloadFooter];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"---%@",scrollView);
}


-(void)JSCollectionView:(JSCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--%d",indexPath.row);
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
