//
//  JSCollectionView+CollectionView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionView+CollectionView.h"

@implementation JSCollectionView (CollectionView)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

#pragma mark - collection数据源代理

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
        return 1;
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // 设置尾部控件的显示和隐藏

    
    if (self.dataArray.count==0) {
        self.mj_footer.hidden=YES;
        return 0;
    }
    else{
        self.mj_footer.hidden=NO;
        return self.dataArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    @try {
        self.collectionViewCellDelegate = [collectionView dequeueReusableCellWithReuseIdentifier:JSCollectionViewCellIdentifier forIndexPath:indexPath];
        id content=self.dataArray[indexPath.item];
        [self.collectionViewCellDelegate  JSCollectionView:self originalData:self.dataArray content:content indexPath:indexPath];;
        return (UICollectionViewCell *)self.collectionViewCellDelegate;
        
    } @catch (NSException *exception) {
        
        
        
        
        
    } @finally {
        
    }
    
    
}



#pragma mark --UICollectionViewDelegateFlowLayout




//头部和底部view

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    


#pragma mark -瀑布流布局（CHTCollectionViewWaterfallLayout）
    
    if ([self.layout isKindOfClass:[CHTCollectionViewWaterfallLayout class]]) {//流水布局改头部底部注册
        
        if(kind==CHTCollectionElementKindSectionHeader){
            self.headerFooterCollectionViewDelegate=[collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:JSCollectionViewHeaderIdentifier forIndexPath:indexPath];//头部
        }
        else if(kind==CHTCollectionElementKindSectionFooter){
            self.headerFooterCollectionViewDelegate=[collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:JSCollectionViewFooterIdentifier forIndexPath:indexPath];//尾部
        }
    }
#pragma mark -普通流水布局
    else {
        
        
        if (kind==UICollectionElementKindSectionHeader) {
            self.headerFooterCollectionViewDelegate=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JSCollectionViewHeaderIdentifier forIndexPath:indexPath];//头部
        }
        else if (kind==UICollectionElementKindSectionFooter)
        {
            
            self.headerFooterCollectionViewDelegate=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JSCollectionViewFooterIdentifier forIndexPath:indexPath];//尾部
        }

        
    }
    
        //回调
        if (self.headerFooterCollectionViewDelegate && [self.headerFooterCollectionViewDelegate respondsToSelector:@selector(JSCollectionViewHeaderFooter:originalData:indexPath:)]) {
            
            [self.headerFooterCollectionViewDelegate JSCollectionViewHeaderFooter:self originalData:self.dataArray indexPath:indexPath];
        }
    
        return (UICollectionReusableView *) self.headerFooterCollectionViewDelegate;
    
    
}



#pragma mark -瀑布流布局（CHTCollectionViewWaterfallLayout）

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (self.collectionViewDelegate && [self.collectionViewDelegate respondsToSelector:@selector(JSCollectionViewWaterfallLayout:layout:sizeForItemAtIndexPath:)]) {
            
            return  [self.collectionViewDelegate JSCollectionViewWaterfallLayout:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
        }
        else{
            
            return CGSizeZero;
        }

    
}



//#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_0
//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    @try {
//        NSString *item=[NSString stringWithFormat:@"%zi",indexPath.item];
//        //        NSLog(@"--item=%@",item);
//        if ([self.showedIndexPaths containsObject:item]) {
//            return;
//        }
//        else
//        {
//            [self.showedIndexPaths addObject:item];
//            
//            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//            
//            scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
//            
//            scaleAnimation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
//            
//            scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//            
//            [cell.layer addAnimation:scaleAnimation forKey:@"transform"];
//            
//        }
//        
//    } @catch (NSException *exception) {
//        
//    } @finally {
//        
//    }
//    
//}
//#endif

@end
