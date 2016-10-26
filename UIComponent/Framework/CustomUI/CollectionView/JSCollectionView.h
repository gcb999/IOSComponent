//
//  JSCollectionView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@interface JSCollectionView : UICollectionView

@end
