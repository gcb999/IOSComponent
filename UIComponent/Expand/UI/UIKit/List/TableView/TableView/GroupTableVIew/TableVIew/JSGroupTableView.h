//
//  JSGroupTableView.h
//  IOS_Compon
//
//  Created by gcb999 on 16/10/27.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSTableView.h"
#import "JSGroupTableViewDelegate.h"
#import "JSGroupTableViewCellDelegate.h"

@interface JSGroupTableView : UITableView<UITableViewDelegate,UITableViewDataSource,JSGroupTableViewDelegate,JSGroupTableViewCellDelegate>


#pragma mark -分组

@property(nonatomic,strong)NSMutableArray<NSString*> *sections;//分组

@property(nonatomic,strong)NSMutableDictionary<NSString *,NSArray *> *rowsOfSectionDic;//组对应列


#pragma mark -属性（仅供分类使用）

@property (nonatomic , strong) UIColor * cellColor;


#pragma mark -cell 左右侧滑按钮自定义 （cell 必须继承MGSwipeTableCell）

@property (nonatomic , strong) NSArray<JSSwipeTableCellModel *> * leftSwipeModel;

@property (nonatomic , strong) NSArray<JSSwipeTableCellModel *> * rightSwipeModel;


#pragma mark -不能修改的属性（仅供分类使用）

@property (nonatomic , assign) NSInteger pageIndex;

@property (nonatomic , weak) id<JSGroupTableViewDelegate> groupTableViewDelegate;

@property (nonatomic , weak) id<JSGroupTableViewCellDelegate> groupTableViewCellDelegate;

-(void)setUpMJRefresh:(JSTableViewState) state;

-(void)loadNewData;

-(void)loadMoreData;





#pragma mark - 初始化方法

-(instancetype)initWithFrame:(CGRect)rect style:(UITableViewStyle)style state:(JSTableViewState)state cellClass:(Class) cellClass delegate:(id<JSGroupTableViewDelegate>)delegate;





@end
