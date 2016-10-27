//
//  JSTableView+UIScrollView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView+UIScrollView.h"

@implementation JSTableView (UIScrollView)


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
            [self.tableViewDelegate scrollViewDidScroll:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidZoom:)]) {
            [self.tableViewDelegate scrollViewDidZoom:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    @try {
        
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
            [self.tableViewDelegate scrollViewWillBeginDragging:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
            [self.tableViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
            [self.tableViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
            [self.tableViewDelegate scrollViewWillBeginDragging:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
            [self.tableViewDelegate scrollViewDidEndDecelerating:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]) {
            [self.tableViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}


- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)]) {
            [self.tableViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)]) {
            [self.tableViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
    @try {
        if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)]) {
            [self.tableViewDelegate scrollViewDidScrollToTop:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}


@end
