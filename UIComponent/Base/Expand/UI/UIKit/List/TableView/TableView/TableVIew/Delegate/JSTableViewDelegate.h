//
//  JSTableViewDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSTableView;
@protocol JSTableScrollViewDelegate;

#import "MGSwipeTableCell.h"

@protocol JSTableViewDelegate <JSTableScrollViewDelegate>

// 网络加载
-(void)JSTableView:(JSTableView *)tableview LoadRequestCurrentPage:(NSInteger)currentPage;

-(void)JSTableView:(JSTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


//侧滑按钮点击
-(BOOL)JSTableView:(JSTableView *)tableview  swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion;


//重新定义Cell（分组）
-(UITableViewCell *)JSTableView:(JSTableView *)tableview cellForRowAtIndexPath:(NSIndexPath *)indexPath;


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

@end


#pragma mark ------------------------------滚动事件---------------------------*/

@protocol JSTableScrollViewDelegate <NSObject>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;                                               // any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2); // any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;   // called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;      // called when scroll view grinds to a halt

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView; // called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating


- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view NS_AVAILABLE_IOS(3_2); // called before the scroll view begins zooming its content
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale; // scale between minimum and maximum. called after any 'bounce' animations


- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;      // called when scrolling animation finished. may be called immediately if already at top




@end