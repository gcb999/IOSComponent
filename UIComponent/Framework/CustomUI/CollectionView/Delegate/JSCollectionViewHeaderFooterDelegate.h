
//
//  JSCollectionViewHeaderFooterDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSCollectionView;


@protocol JSCollectionViewHeaderFooterDelegate <NSObject>


//单行
-(void)JSCollectionViewHeaderFooter:(JSCollectionView *)collectionView   originalData:(NSArray *)originalData indexPath:(NSIndexPath *)indexpath;


@end
