//
//  JSTableViewCellDelegate.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSTableView;



@protocol JSTableViewCellDelegate <NSObject>

//单行
-(void)JSTableView:(JSTableView *)tableView   originalData:(NSArray *)originalData content:(id)content indexPath:(NSIndexPath *)indexpath;


//分组
-(void)JSTableView:(JSTableView *)tableView   sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections content:(id)content indexPath:(NSIndexPath *)indexpath;





@end
