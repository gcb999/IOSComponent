//
//  JSTableView+HeaderView.m
//  IOS_Compon
//
//  Created by gcb999 on 16/10/31.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView+HeaderView.h"



//1.将YZHeaderScaleImage导入项目或者使用cocoapods导入
//2.导入#import "UIScrollView+HeaderScaleImage.h"
//3.使用tableView或者scrollView
//4.设置了tableView头部视图，`一定记得清空头部视图背景颜色`

@implementation JSTableView (HeaderView)

-(void)setupHeader{
    
    // 设置tableView头部缩放图片 *一行代码就集成了*
    self.yz_headerScaleImage = [UIImage imageNamed:@"header"];
    
    // 设置tableView头部视图，必须设置头部视图背景颜色为clearColor,否则会被挡住
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    // 清空头部视图背景颜色
    headerView.backgroundColor = [UIColor clearColor];
    self.tableHeaderView = headerView;
}

@end
