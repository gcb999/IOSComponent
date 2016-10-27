//
//  JSGroupTableViewCellDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSGroupTableViewCellDelegate <NSObject>


-(void)JSGroupTableView:(JSGroupTableView *)tableView   sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections content:(id)content indexPath:(NSIndexPath *)indexpath;



@end
