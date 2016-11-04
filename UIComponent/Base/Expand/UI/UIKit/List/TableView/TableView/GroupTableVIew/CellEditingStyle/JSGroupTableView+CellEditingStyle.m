//
//  JSGroupTableView+CellEditingStyle.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSGroupTableView+CellEditingStyle.h"

@implementation JSGroupTableView (CellEditingStyle)

#pragma mark -代理方法 (添加左边,右边按钮）

-(NSArray*) swipeTableCell:(MGSwipeTableCell*) cell swipeButtonsForDirection:(MGSwipeDirection)direction
             swipeSettings:(MGSwipeSettings*) swipeSettings expansionSettings:(MGSwipeExpansionSettings*) expansionSettings
{
    
    
    
#pragma mark - 左侧滑
    if (direction == MGSwipeDirectionLeftToRight) {
        
        NSMutableArray<MGSwipeButton *> *leftButtons=[NSMutableArray array];
        for (JSSwipeTableCellModel * model in self.leftSwipeModel) {
            
            MGSwipeButton *leftButton=   [MGSwipeButton buttonWithTitle:model.title icon:[UIImage imageNamed:model.iconUrl] backgroundColor:model.color];
            [leftButtons addObject:leftButton];
        }
        return leftButtons;
        
    }
#pragma mark - 右侧滑
    else {
        
        NSMutableArray *rightButtons=[NSMutableArray array];
        for (JSSwipeTableCellModel * model in self.rightSwipeModel) {
            
            MGSwipeButton *btn = [MGSwipeButton buttonWithTitle:model.title icon:[UIImage imageNamed:model.iconUrl] backgroundColor:model.color padding:15 callback:^BOOL(MGSwipeTableCell *sender) {
                return YES;
            }];
            [rightButtons addObject:btn];
        }
        return IS_NSArray(rightButtons)?rightButtons:nil;
    }
}



#pragma mark -按钮的点击代理方法

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion
{
    
    
    if ([self.groupTableViewDelegate respondsToSelector:@selector(JSGroupTableView:swipeTableCell:tappedButtonAtIndex:direction:fromExpansion:)]) {
        [self.groupTableViewDelegate JSGroupTableView:self swipeTableCell:cell tappedButtonAtIndex:index direction:direction fromExpansion:fromExpansion] ;
    }
    
    //    switch (direction) {
    //        case MGSwipeDirectionLeftToRight: {
    //            if (index == 0) {
    //                NSLog(@"right ------- 0");
    //            }else{
    //                NSLog(@"right ------- 1");
    //            }
    //            break;
    //        }
    //        case MGSwipeDirectionRightToLeft: {
    //            if (index == 0) {
    //                NSLog(@"left ------- 0");
    //                //                // 这里简单的做了个删除操作
    //                //                NSIndexPath * path = [_tableView indexPathForCell:cell];
    //                //                [_arrayTest removeObjectAtIndex:path.row];
    //                //                [_tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    //                //                return NO;
    //            }else{
    //                NSLog(@"left ------- 1");
    //            }
    //            break;
    //        }
    //    }
    return YES;
}

@end
