//
//  JSTableView+TableView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView+TableView.h"

@implementation JSTableView (TableView)


#pragma mark ----------------------TableView 代理方法----------------------------------------


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:JSTableViewIdentifier forIndexPath:indexPath];
    
    if (self.cellColor) {
        cell.backgroundColor=self.cellColor;
    }
    
    self.tableViewCellDelegate=cell;
    id content=self.dataArray[indexPath.row];
//    if ([cell isKindOfClass:[MGSwipeTableCell class]]) {//添加左侧按钮
//        MGSwipeTableCell *mgcell=(MGSwipeTableCell *)cell;
//        mgcell.delegate=self;
//        mgcell.allowsMultipleSwipe = NO;
//    }
    [self.tableViewCellDelegate JSTableView:self originalData:self.dataArray content:content indexPath:indexPath];
   
    return (UITableViewCell *)self.tableViewCellDelegate;
    
    
    
}






#pragma mark -给cell添加动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return;
  
    
//    if ([cell isKindOfClass:[CategoryTableViewCell class]]) {//每次都用动画
//        
//        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//        
//        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
//        
//        scaleAnimation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
//        
//        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//        
//        [cell.layer addAnimation:scaleAnimation forKey:@"transform"];
//        return;
//    }
//    //
//    //indexpath第一次加载的有动画  否则没有
//    NSString *row=[NSString stringWithFormat:@"%zi",indexPath.row];
//    if ([self.showedIndexPaths containsObject:row]) {
//        return;
//    }
//    else
//    {
//        
//        NSString *row=[NSString stringWithFormat:@"%zi",indexPath.row];
//        [self.showedIndexPaths addObject:row];//加入缓存
//        
//        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//        
//        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)];
//        
//        scaleAnimation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
//        
//        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//        
//        [cell.layer addAnimation:scaleAnimation forKey:@"transform"];
//        
//    }
    
    
}












@end
