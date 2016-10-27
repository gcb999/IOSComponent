//
//  JSCollectionView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
//代理
#import "JSCollectionViewDelegate.h"
#import "JSCollectionViewCellDelegate.h"
#import "JSCollectionViewHeaderFooterDelegate.h"
#import "JSCollectionViewWaterfallLayout.h"
#import "JSCollectionViewWaterfallLayout.h"


typedef NS_ENUM (NSInteger,JSCollectionViewState) {
    /** 普通列表 */
    JSCollectionViewNormal = 1,
    /** 显示上拉 */
    JSCollectionViewHeader=2,
    /** 显示下拉 */
    JSCollectionViewFooter=3,
    /** 显示上下拉 */
    JSCollectionViewHeaderFooter=4
};


//cell
static NSString *const JSCollectionViewCellIdentifier = @"JSCollectionViewCellIdentifier";

//header
static NSString *const JSCollectionViewHeaderIdentifier = @"JSCollectionViewHeaderIdentifier";

//footer
static NSString *const JSCollectionViewFooterIdentifier = @"JSCollectionViewFooterIdentifier";


@interface JSCollectionView : UICollectionView<JSCollectionViewDelegate,JSCollectionViewCellDelegate,UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>


@property (nonatomic , strong) NSMutableArray * dataArray;


#pragma mark -只读代理属性

@property (nonatomic , weak) id<JSCollectionViewDelegate> collectionViewDelegate;

@property (nonatomic , weak) id<JSCollectionViewCellDelegate>  collectionViewCellDelegate;

@property(nonatomic,weak)id<JSCollectionViewHeaderFooterDelegate> headerFooterCollectionViewDelegate;//头部与底部代理方法

-(void)setUpMJRefresh:(JSCollectionViewState) state;

-(void)loadNewData;

-(void)loadMoreData;




#pragma mark -不能修改的属性（仅供分类使用）

@property (nonatomic , assign) NSInteger pageIndex;

//流水布局
@property (nonatomic , strong) UICollectionViewLayout * layout;


//正常
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass;

//头部
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass headerClass:(Class) headerClass;


//底部
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass   footerClass:(Class) footerClass;

//头部和底部

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout delegate:(id<JSCollectionViewDelegate>)delegate   state:(JSCollectionViewState)state  cellClass:(Class) cellclass headerClass:(Class) headerClass  footerClass:(Class) footerClass;


@end
