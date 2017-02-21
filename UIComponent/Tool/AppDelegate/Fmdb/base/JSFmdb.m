//
//  JSFmdb.m
//  IOS_Compon
//
//  Created by gcb999 on 17/2/17.
//  Copyright © 2017年 gcb999. All rights reserved.
//

#import "JSFmdb.h"
#import "FMDatabase.h"

@implementation JSFmdb

- (BOOL) isTableOK:(NSString *)tableName
{
    @try {
        
        
        NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        docs=[docs stringByAppendingPathComponent:@"DLAPP.db"];
        NSLog(@"--->doc=%@",docs);
        
       FMDatabase*db=[FMDatabase databaseWithPath:docs];
        
        FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
        while ([rs next])
        {
            // just print out what we've got in a number of formats.
            NSInteger count = [rs intForColumn:@"count"];
            NSLog(@"isTableOK %d", count);
            
            if (0 == count)
            {
                return NO;
            }
            else
            {
                return YES;
            }
        }
        
        return NO;
        
    } @catch (NSException *exception) {
        
         return NO;
        
    } @finally {
        
    }
}




//===================创建表=======================
#pragma mark -创建数据库
+(BOOL)createTable{
    
    @try {
        
        
        NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        docs=[docs stringByAppendingPathComponent:@"DLAPP.db"];
        NSLog(@"--->doc=%@",docs);
        
        FMDatabase *db=[FMDatabase databaseWithPath:docs];
        if([db open]){
#pragma mark --------- 历史搜索
            NSArray *propertys=@[
                                 @"title"//内容
                                 ,@"flag"//标识
                                 ];
            
            
            
          BOOL isSuccess=[self buildCreateSqlWithTable:@"HistorySearch" Propertys:propertys  db:db];
            
            if (isSuccess==NO) {
                return isSuccess;
            }
            
#pragma mark ---------联想搜索
            propertys=@[
                        @"title"//内容
                        ,@"flag"//标识
                        ];
           isSuccess= [self buildCreateSqlWithTable:@"SearchLenovo" Propertys:propertys db:db ];
            
            if (isSuccess==NO) {
                return isSuccess;
            }
            
#pragma mark ---------SKU详情页面
            propertys=@[
                        @"color"//内容
                        ,@"size"//标识
                        ,@"type"//内容
                        ,@"imageUrl"//标识
                        ,@"image_hd"//内容
                        ,@"price_text"//标识
                        ,@"product_spec_price_text"//
                        ,@"sku"//内容
                        ,@"stock"//标识
                        ,@"modelType"
                        ,@"warehouse"
                        ,@"spu"
                        ,@"typeName"
                        ];
           isSuccess= [self buildCreateSqlWithTable:@"CartSku" Propertys:propertys db:db ];
            if (isSuccess==NO) {
                return isSuccess;
            }
            
           
#pragma mark ---------SKU详情页面
            propertys=@[
                        @"color"//
                        ,@"size"//
                        ,@"FID"
                        ,@"flag"//标识
                        ];
            
           isSuccess=[self buildCreateSqlWithTable:@"sizeColorFilter" Propertys:propertys db:db ];
            if (isSuccess==NO) {
                return isSuccess;
            }
            
            
            
        }
        
        [db close];
        
        return YES;
        
    } @catch (NSException *exception) {
        
        return NO;
        
        
    } @finally {
        
    }
    
}

#pragma mark -创建表
+( BOOL)buildCreateSqlWithTable:(NSString *)tableName  Propertys:(NSArray *)propertys  db:(FMDatabase *)db {
    
    @try {
        
        
        NSString *dropsql=[NSString stringWithFormat:@"drop table if exists %@",tableName];
        [db executeUpdate:dropsql];
        
        NSMutableString *sql=[NSMutableString string];
        [sql appendFormat:@"CREATE TABLE %@ (PID INTEGER PRIMARY KEY AUTOINCREMENT,",tableName];
        for (int i=0; i<propertys.count; i++) {
            if (i==propertys.count-1) {
                [sql appendFormat:@"%@ text)",propertys[i]];
            }
            else  [sql appendFormat:@"%@ text,",propertys[i]];
        }
        
        
        BOOL flag= [db executeUpdate:sql ];
        
        return flag;
    
    } @catch (NSException *exception) {
        
        return NO;
        
    } @finally {
        
    }
    
    
}



//===================删除=======================
#pragma mark -删除sql操作
//ID 等于0 删除所有表
+(BOOL)deleteTableName:(NSString *)tableName PID:(int)ID{
    
    @try {
        
        NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        docs=[docs stringByAppendingPathComponent:@"DLAPP.db"];
        NSLog(@"--->doc=%@",docs);
        
     FMDatabase*   db=[FMDatabase databaseWithPath:docs];
        if ([db open]) {
            
            if(ID==0){
                NSString *sql=[NSString stringWithFormat:@"DELETE FROM %@",tableName];
                [db executeUpdate:sql];
            }
            else{
                NSString *sql=[NSString stringWithFormat:@"DELETE FROM %@ WHERE PID =%zi",tableName,ID];
                [db executeUpdate:sql];
            }
            if ([db hadError])
            {
                NSLog(@"DELETE FROM %@  ERROR  %d: %@",tableName, [db lastErrorCode], [db lastErrorMessage]);
                return NO;
            }
            [db close];
            
        }
        return YES;
    } @catch (NSException *exception) {
        
         return NO;
        
    } @finally {
        
    }
}



//-(NSArray *)SelectTableName:(NSString *)tableName  startPage:(int)page{
//
//    NSMutableArray *temp=[NSMutableArray array];
//    NSString *sql=[NSString stringWithFormat:@"SELECT  * FROM %@ WHERE PID>=%zi AND PID<=%zi ORDER BY PID DESC",tableName,(page-1)*DB_PAGESIZE+1,page*DB_PAGESIZE];
//    FMResultSet *rs=[_db executeQuery:sql];
//
//    while ([rs next]){
//
//        if ([tableName isEqualToString:@"OrderProduce"]) {
//            GCB_Product *product= [GCB_Product ProductWithResultSet:rs];
//            [temp addObject:product];
//        }
//    }
//    return temp;
//}

#pragma mark -查询

+(void)executeQuery:(NSString *)sql queryResBlock:(void (^)(FMResultSet *))queryResBlock{
   
    @try {
           
        NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        docs=[docs stringByAppendingPathComponent:@"DLAPP.db"];
        NSLog(@"--->doc=%@",docs);
        
        FMDatabase*   db=[FMDatabase databaseWithPath:docs];
       
        if ([db open]) {
        
                FMResultSet *rs=[db executeQuery:sql];
                if(queryResBlock != nil) queryResBlock(rs);
                NSLog(@"%@",[NSThread currentThread]);

        }
    } @catch (NSException *exception) {
        
        
        
    } @finally {
        
    }
}



//===================插入=======================
#pragma mark -插入数据库操作

+(BOOL)insertTablewithSql:(NSString *)sql{
    //    NSLog(@"%@",sql);
    
    @try {
        
        NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        docs=[docs stringByAppendingPathComponent:@"DLAPP.db"];
        NSLog(@"--->doc=%@",docs);
        
       FMDatabase* db=[FMDatabase databaseWithPath:docs];
        if ([db open]) {
            [db executeUpdate:sql];
            if ([db hadError])
            {
                NSLog(@"insertWith ERROR %d: %@", [db lastErrorCode], [db lastErrorMessage]);
                return NO;
            }
            else{
                
                //            return [db lastInsertRowId];
                
            }
            [db close];
        }
        
        return  YES;
    } @catch (NSException *exception) {
        
         return NO;
        
    } @finally {
        
    }
    
}
#pragma mark -拼接插入sql语句

+(NSString *)buildInsertTableName:(NSString *)tablename keyArray:(NSArray *)keyArray valueArray:(NSArray *)valueArray {
    
    @try {
        
        NSMutableString *appendStr=[NSMutableString string];
        NSMutableString *paramStr=[NSMutableString string];
        [appendStr appendFormat:@"INSERT INTO %@(",tablename];
        
        for (int i=0; i<keyArray.count; i++) {
            NSString *value=valueArray[i];
            if (i==keyArray.count-1) {
                [appendStr appendFormat:@"%@)VALUES (",keyArray[i]];
                [paramStr appendFormat:@"'%@')",value];
            }
            else{
                [appendStr appendFormat:@"%@,",keyArray[i]];
                [paramStr appendFormat:@"'%@',",value];
            }
        }
        [appendStr appendString:paramStr];
        return appendStr;
        
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}


//===================更新========================
#pragma mark -更新数据库操作
+(BOOL)updateTableWithSql:(NSString *)sql{
    
    @try {
        
        NSString *docs=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        docs=[docs stringByAppendingPathComponent:@"DLAPP.db"];
        NSLog(@"--->doc=%@",docs);
        
        FMDatabase* db=[FMDatabase databaseWithPath:docs];
        if ([db open]) {
            [db executeUpdate:sql];
            if ([db hadError])
            {
                NSLog(@"UpdateWith ERROR %d: %@", [db lastErrorCode], [db lastErrorMessage]);
                return NO;
            }
            else{
                NSLog(@"更新成功");
            }
            [db close];
        }
        return YES;
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

#pragma mark -拼接更新sql语句
+(NSString *)buildUpdateName:(NSString *)tablename keyArray:(NSArray *)keyArray valueArray:(NSArray *)valueArray  PID:(int)ID{
    @try {
        
        
        
        NSMutableString *appendStr=[NSMutableString string];
        [appendStr appendFormat:@"UPDATE %@ SET ",tablename];
        for (int i=0; i<keyArray.count; i++) {
            NSString *value=valueArray[i];
            if (i==keyArray.count-1)
                [appendStr appendFormat:@"%@='%@'",keyArray[i],value];
            else
                [appendStr appendFormat:@"%@='%@',",keyArray[i],value];
        }
        [appendStr appendFormat:@"  where PID=%zi",ID];
        return appendStr;
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
}







@end
