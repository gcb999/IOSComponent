
//
//  SearchDAO.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "SearchDAO.h"

@implementation SearchDAO

-(BOOL)createTable{
    
    [JSFmdb truncateTable:@"user"];
    
    //创建表
    BOOL res =  [JSFmdb executeUpdate:@"create table if not exists user(id integer primary key autoIncrement,name text not null default '',age integer not null default 0);"];
    
    if(res){
        NSLog(@"创表执行成功");
    }else{
        NSLog(@"创表执行失败");
    }
    return res;
}


-(BOOL)insert{
    
    BOOL res2= [JSFmdb executeUpdate:@"insert into user (name,age) values('jack',27);"];
    
    if(res2){
        NSLog(@"添加数据成功");
    }else{
        NSLog(@"添加数据失败");
    }
    return res2;
}


-(void)queryResBlock:(void(^)(FMResultSet *set))queryResBlock{
    
    NSArray *columns = [JSFmdb executeQueryColumnsInTable:@"user"];
    
    NSLog(@"列信息：%@",columns);
    
    //查询数据
    [JSFmdb executeQuery:@"select * from user;" queryResBlock:^(FMResultSet *set) {
        
        while ([set next]) {
            NSLog(@"%@-%@",[set stringForColumn:@"name"],[set stringForColumn:@"age"]);
            queryResBlock(set);
        }
        
    }];

    
}

-(NSInteger )count{
    
    //计算记录数
    NSUInteger count = [JSFmdb countTable:@"user"];
    
    return count;
}



@end
