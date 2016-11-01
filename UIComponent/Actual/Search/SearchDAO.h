//
//  SearchDAO.h
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSFmdb+fmdb.h"

@interface SearchDAO : NSObject

-(BOOL)createTable;


-(BOOL)insert;


-(void)queryResBlock:(void(^)(FMResultSet *set))queryResBlock;

//计算记录数
-(NSInteger )count;



@end

/*------------------------------用法---------------------

SearchDAO *dao=[[SearchDAO alloc] init];
if ([dao createTable]) {//创建表
    
    [dao insert];//插入数据
    
    [dao queryResBlock:^(FMResultSet *set) {
        NSLog(@"%@-%@",[set stringForColumn:@"name"],[set stringForColumn:@"age"]);
    }];//查询数据
}

 ------------------------------*/