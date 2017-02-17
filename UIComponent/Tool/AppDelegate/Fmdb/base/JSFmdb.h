//
//  JSFmdb.h
//  IOS_Compon
//
//  Created by gcb999 on 17/2/17.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface JSFmdb : NSObject


#pragma mark - ------------------创建表------

#pragma mark -创建表
+(BOOL)createTable;


#pragma mark - -----------------插入-------
#pragma mark -拼接插入sql语句
+(NSString *)buildInsertTableName:(NSString *)tablename keyArray:(NSArray *)keyArrary valueArrary:(NSArray *)valueArrary;

#pragma mark -插入数据库操作
+(BOOL)insertTablewithSql:(NSString *)sql;

#pragma mark - ------------------删除------
#pragma mark -删除数据库操作
+(BOOL)deleteTableName:(NSString *)tableName PID:(int)ID;



#pragma mark - ------------------更新------
#pragma mark -拼接更新sql语句
+(NSString *)buildUpdateName:(NSString *)tablename keyArray:(NSArray *)keyArrary valueArrary:(NSArray *)valueArrary  PID:(int)ID;

#pragma mark -更新数据库操作
+(BOOL)updateTableWithSql:(NSString *)sql;


//#pragma mark - ------------------查询------
//
#pragma mark -通过ID来查询数据

+(void)executeQuery:(NSString *)sql queryResBlock:(void(^)(FMResultSet *set))queryResBlock;




@end
