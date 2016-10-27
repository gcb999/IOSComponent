//
//  JSSwipeTableCell.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSSwipeTableCell.h"

@implementation JSSwipeTableCell

-(void)JSTableView:(JSTableView *)tableView originalData:(NSArray *)originalData content:(id)content indexPath:(NSIndexPath *)indexpath{
    
    self.textLabel.text=[NSString stringWithFormat:@"%d",indexpath.row];
    
}

-(void)JSGroupTableView:(JSGroupTableView *)tableView sections:(NSArray *)sections rowsOfSections:(NSDictionary<NSString *,NSArray *> *)rowsOfSections content:(id)content indexPath:(NSIndexPath *)indexpath{
     self.textLabel.text=[NSString stringWithFormat:@"%d-%d",indexpath.section,indexpath.row];
}
@end
