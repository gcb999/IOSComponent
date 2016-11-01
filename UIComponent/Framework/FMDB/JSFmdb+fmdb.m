//
//  JSFmdb+fmdb.m
//  IOS_Compon
//
//  Created by gcb999 on 16/11/1.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSFmdb+fmdb.h"

@implementation JSFmdb (fmdb)



/**
 *  数据库队列的初始化：本操作一个
 */
+(void)initialize{
    
    //取出实例
    JSFmdb *jsFmdb=[JSFmdb shareInstance];
    
    //获取项目info文件
    NSDictionary *infoDict=[[NSBundle mainBundle] infoDictionary];
    
    //获取项目Bundle Name:英文(CFBundleName)
    NSString *key=(NSString *)kCFBundleNameKey;
    NSString *bundleName=infoDict[key];
    //拼接数据库名
    NSString *dbName=[NSString stringWithFormat:@"%@%@",bundleName,@".sql"];
    
    //在沙盒中存入数据库文件
    NSString *dbPath=[bundleName.documentsSubFolder stringByAppendingPathComponent:dbName];
    
    const BOOL needLogSqlFilePath=YES;
    
    if(needLogSqlFilePath) NSLog(@"dbPath:%@",dbPath);
    
    //创建队列
    FMDatabaseQueue *queue =[FMDatabaseQueue databaseQueueWithPath:dbPath];
    
    if(queue==nil)NSLog(@"code=1：创建数据库失败，请检查");
    
    jsFmdb.queue = queue;
}




/**
 *  执行一个更新语句
 *
 *  @param sql 更新语句的sql
 *
 *  @return 更新语句的执行结果
 */
+(BOOL)executeUpdate:(NSString *)sql{
    
    __block BOOL updateRes = NO;
    
   JSFmdb *jsFmdb=[JSFmdb shareInstance];
    
    [jsFmdb.queue inDatabase:^(FMDatabase *db) {
        
        updateRes = [db executeUpdate:sql];
    }];
    
    return updateRes;
}





/**
 *  执行一个查询语句
 *
 *  @param sql              查询语句sql
 *  @param queryResBlock    查询语句的执行结果
 */
+(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock{
    
   JSFmdb *jsFmdb=[JSFmdb shareInstance];
    
    [jsFmdb.queue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *set = [db executeQuery:sql];
        
        if(queryResBlock != nil) queryResBlock(set);
        
        NSLog(@"%@",[NSThread currentThread]);
    }];
}




/**
 *  查询出指定表的列
 *
 *  @param table table
 *
 *  @return 查询出指定表的列的执行结果
 */
+(NSArray *)executeQueryColumnsInTable:(NSString *)table{
    
    NSMutableArray *columnsM=[NSMutableArray array];
    
    NSString *sql=[NSString stringWithFormat:@"PRAGMA table_info (%@);",table];
    
    [self executeQuery:sql queryResBlock:^(FMResultSet *set) {
        
        //循环取出数据
        while ([set next]) {
            NSString *column = [set stringForColumn:@"name"];
            [columnsM addObject:column];
        }
        
        if(columnsM.count==0) NSLog(@"code=2：您指定的表：%@,没有字段信息，可能是表尚未创建！",table);
    }];
    
    return [columnsM copy];
}


/**
 *  表记录数计算
 *
 *  @param table 表
 *
 *  @return 记录数
 */
+(NSUInteger)countTable:(NSString *)table{
    
    NSString *alias=@"count";
    
    NSString *sql=[NSString stringWithFormat:@"SELECT COUNT(*) AS %@ FROM %@;",alias,table];
    
    __block NSUInteger count=0;
    
    [self executeQuery:sql queryResBlock:^(FMResultSet *set) {
        
        while ([set next]) {
            
            count = [[set stringForColumn:alias] integerValue];
        }
    }];
    
    return count;
}


/**
 *  清空表（但不清除表结构）
 *
 *  @param table 表名
 *
 *  @return 操作结果
 */
+(BOOL)truncateTable:(NSString *)table{
    
    BOOL res = [self executeUpdate:[NSString stringWithFormat:@"DELETE FROM '%@'", table]];
    [self executeUpdate:[NSString stringWithFormat:@"DELETE FROM sqlite_sequence WHERE name='%@';", table]];
    return res;
}


@end
