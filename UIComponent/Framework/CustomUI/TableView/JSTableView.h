//
//  JSTableView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/26.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTableViewDelegate.h"
#import "JSTableViewCellDelegate.h"


typedef NS_ENUM (NSInteger,JSTableViewState) {
    /** 普通列表 */
    JSTableViewNormal = 1,
    /** 显示上拉 */
    JSTableViewHeader=2,
    /** 显示下拉 */
    JSTableViewFooter=3,
    /** 显示上下拉 */
    JSTableViewHeaderFooter=4
};

static NSString *const JSTableViewIdentifier=@"JSTableViewIdentifier";



@interface JSTableView : UITableView







@property (nonatomic , strong) NSMutableArray * dataArray;


#pragma mark -属性（仅供分类使用）

@property (nonatomic , strong) UIColor * cellColor;



#pragma mark -不能修改的属性（仅供分类使用）

@property (nonatomic , assign) NSInteger pageIndex;

@property (nonatomic , weak) id<JSTableViewDelegate> tableViewDelegate;

@property (nonatomic , weak) id<JSTableViewCellDelegate> tableViewCellDelegate;

@property(nonatomic,weak)Class cellClass;

-(void)setUpMJRefresh:(JSTableViewState) state;

#pragma mark - 初始化方法
-(instancetype)initWithFrame:(CGRect)rect style:(UITableViewStyle)style state:(JSTableViewState)state cellClass:(Class) cellclass;





@end



