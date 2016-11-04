//
//  JSGroupTableView+UIScrollView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSGroupTableView+UIScrollView.h"

@implementation JSGroupTableView (UIScrollView)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
            [self.groupTableViewDelegate scrollViewDidScroll:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidZoom:)]) {
            [self.groupTableViewDelegate scrollViewDidZoom:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    @try {
        
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
            [self.groupTableViewDelegate scrollViewWillBeginDragging:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)]) {
            [self.groupTableViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
            [self.groupTableViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
            [self.groupTableViewDelegate scrollViewWillBeginDragging:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
            [self.groupTableViewDelegate scrollViewDidEndDecelerating:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)]) {
            [self.groupTableViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}


- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)]) {
            [self.groupTableViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)]) {
            [self.groupTableViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    
    @try {
        if ([self.groupTableViewDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)]) {
            [self.groupTableViewDelegate scrollViewDidScrollToTop:scrollView];
        }
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}


@end
