//
//  JSCollectionViewCellDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSCollectionView;

@protocol JSCollectionViewCellDelegate <NSObject>

//单行
-(void)JSCollectionView:(JSCollectionView *)collectionView   originalData:(NSArray *)originalData content:(id)content indexPath:(NSIndexPath *)indexpath;


@end
