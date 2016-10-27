//
//  JSCollectionViewDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JSCollectionView;

@class JSCollectionViewWaterfallLayout;

@protocol JSCollectionViewDelegate <NSObject>

// 网络加载
-(void)JSCollectionView:(JSCollectionView *)collectionView LoadRequestCurrentPage:(NSInteger)currentPage;


//瀑布流
- (CGSize)JSCollectionViewWaterfallLayout:(JSCollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;



@end
