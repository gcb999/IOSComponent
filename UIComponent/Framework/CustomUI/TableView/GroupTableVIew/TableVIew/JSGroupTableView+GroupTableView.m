//
//  JSGroupTableView+GroupTableView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSGroupTableView+GroupTableView.h"

@implementation JSGroupTableView (GroupTableView)


#pragma mark ----------------------TableView 分组代理方法----------------------------------------


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sections.count;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * array = self.rowsOfSectionDic[self.sections[section]];
    return array.count;
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //cell重新定义
    if ([self.groupTableViewDelegate respondsToSelector:@selector(JSGroupTableView:cellForRowAtIndexPath:)]) {
        
       return  [self.groupTableViewDelegate JSGroupTableView:self cellForRowAtIndexPath:indexPath];
        
    }
    else{
    
        
        
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:JSTableViewIdentifier forIndexPath:indexPath];
        self.groupTableViewCellDelegate=cell;
        NSString *str= self.sections[indexPath.section];
        
        NSArray *array= self.rowsOfSectionDic[str];
        
        id content=array[indexPath.row];
        
        
        
        if ([cell isKindOfClass:[MGSwipeTableCell class]]) {
            MGSwipeTableCell *mgcell=(MGSwipeTableCell *)cell;
            mgcell.delegate=self;
            mgcell.allowsMultipleSwipe = NO;
        }
        
        [self.groupTableViewCellDelegate JSGroupTableView:self sections:self.sections rowsOfSections:self.rowsOfSectionDic content:content indexPath:indexPath];
        
        return cell;
        
        
    }
    
    
}



@end
