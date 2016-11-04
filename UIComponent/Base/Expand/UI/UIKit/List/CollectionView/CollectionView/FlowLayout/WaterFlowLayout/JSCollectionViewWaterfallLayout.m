//
//  JSCollectionViewWaterfallLayout.m
//  DressLink
//
//  Created by gcb999 on 16/6/23.
//  Copyright © 2016年 com.sailvan.DressLink. All rights reserved.
//

#import "JSCollectionViewWaterfallLayout.h"

@implementation JSCollectionViewWaterfallLayout


- (instancetype)init
{
    self = [super init];
    if (self) {

        
        // 设置布局
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.headerHeight = 0;           // headerView高度
        self.footerHeight = 0;           // footerView高度
        self.columnCount  = 2;             // 几列显示
        self.minimumColumnSpacing    = 2;  // cell之间的水平间距
        self.minimumInteritemSpacing = 2;  // cell之间的垂直间距
        
        
    }
    return self;
}



#pragma mark -width cell的宽度（计算出来的）

-(CGFloat)cellWidth{
    
    
    //1: section 边距宽度
    CGFloat sectionWidth=self.sectionInset.left+self.sectionInset.right;
    //2：cell水平间距
    CGFloat mininumWidth=self.minimumColumnSpacing*self.columnCount;
    return (IPHONScreenWidth-sectionWidth-mininumWidth)/self.columnCount;
}




@end
