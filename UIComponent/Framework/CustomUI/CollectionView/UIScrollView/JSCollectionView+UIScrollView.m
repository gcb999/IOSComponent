//
//  JSCollectionView+UIScrollView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionView+UIScrollView.h"

@implementation JSCollectionView (UIScrollView)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
            [self.collectionViewDelegate scrollViewDidScroll:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidZoom:)]) {
            [self.collectionViewDelegate scrollViewDidZoom:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    @try {
        
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
            [self.collectionViewDelegate scrollViewWillBeginDragging:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
            [self.collectionViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
            [self.collectionViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
            [self.collectionViewDelegate scrollViewWillBeginDragging:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
            [self.collectionViewDelegate scrollViewDidEndDecelerating:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]) {
            [self.collectionViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}


- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)]) {
            [self.collectionViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)]) {
            [self.collectionViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
    @try {
        if ([self.collectionViewDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)]) {
            [self.collectionViewDelegate scrollViewDidScrollToTop:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}



@end
