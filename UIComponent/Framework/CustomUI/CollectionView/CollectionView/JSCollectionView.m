//
//  JSCollectionView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionView.h"

@implementation JSCollectionView


//头部和底部
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout collectionViewCellClass:(Class<JSCollectionViewCellDelegate>)cellclass collectionViewDelegate:(id<JSCollectionViewDelegate>)delegate{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
 
        self.flowLayout=layout;
        self.pagingEnabled = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
        self.delegate = self;
        self.dataSource = self;
        self.dataArray=[NSMutableArray array];
      
        [self registerClass:cellclass forCellWithReuseIdentifier:JSCollectionViewCellIdentifier];
      
        //代理方法
        self.collectionViewDelegate=delegate;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


//正常
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass
{
    
    
    return  [self  initWithFrame:frame collectionViewLayout:layout delegate:delegate state:state cellClass:cellclass headerClass:nil footerClass:nil];
    
    
}

//头部
 - (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass headerClass:(Class) headerClass
{
    
       return  [self  initWithFrame:frame collectionViewLayout:layout delegate:delegate state:state cellClass:cellclass headerClass:headerClass footerClass:nil];
}


//底部
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass   footerClass:(Class) footerClass
{
    return  [self  initWithFrame:frame collectionViewLayout:layout delegate:delegate state:state cellClass:cellclass headerClass:nil footerClass:footerClass];

}

//头部和底部

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass headerClass:(Class) headerClass  footerClass:(Class) footerClass
{
    
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        

        self.dataArray=[NSMutableArray array];
        
        
        //MJ
        [self setUpMJRefresh:state];
        
        
        //代理
        self.collectionViewDelegate=delegate;
        self.dataSource=self;
        self.delegate=self;
        
        
        //cell
        [self registerClass:cellclass forCellWithReuseIdentifier:JSCollectionViewCellIdentifier];
        
        //头部
        if (headerClass) {
            [self registerClass:headerClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JSCollectionViewHeaderIdentifier];
            
        }
        else{
            [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JSCollectionViewHeaderIdentifier];
            
        }
        
        //底部
        if (footerClass) {
            [self registerClass:footerClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JSCollectionViewFooterIdentifier];
        }
        else{
            [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JSCollectionViewFooterIdentifier];
            
        }
        
        
        
        
        
    }
    return self;
}




@end
