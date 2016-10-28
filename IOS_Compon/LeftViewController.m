//
//  LeftViewController.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "LeftViewController.h"
#import "JSCollectionViewCell.h"

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blueColor];
    [self collectioinView];
    
    
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


@end
