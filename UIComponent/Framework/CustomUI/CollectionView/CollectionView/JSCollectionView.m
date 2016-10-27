//
//  JSCollectionView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionView.h"

@implementation JSCollectionView




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
        self.layout=layout;
        self.pageIndex=1;
        
        self.backgroundColor=[UIColor whiteColor];
        
        //MJ
        [self setUpMJRefresh:state];
        
        
        //代理
        self.collectionViewDelegate=delegate;
        self.dataSource=self;
        self.delegate=self;
        
        
        //cell
        [self registerClass:cellclass forCellWithReuseIdentifier:JSCollectionViewCellIdentifier];
        
        
#pragma mark -瀑布流布局（CHTCollectionViewWaterfallLayout）
        
        if ([layout isKindOfClass:[CHTCollectionViewWaterfallLayout class]]) {//流水布局改头部底部注册
        
             //头部
            headerClass=(headerClass==nil)?[UICollectionReusableView class]:headerClass;
            [self registerClass:headerClass forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:JSCollectionViewHeaderIdentifier];
       
            
            //底部
            footerClass=(footerClass==nil)?[UICollectionReusableView class]:footerClass;
            [self registerClass:footerClass forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:JSCollectionViewFooterIdentifier];

        }
#pragma mark -普通流水布局
        else {
            
            //头部
            headerClass=(headerClass==nil)?[UICollectionReusableView class]:headerClass;
            [self registerClass:headerClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JSCollectionViewHeaderIdentifier];
                
         
            //底部
            footerClass=(footerClass==nil)?[UICollectionReusableView class]:footerClass;
            [self registerClass:footerClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JSCollectionViewFooterIdentifier];
            
        }
    
        
    }
    return self;
}




@end
