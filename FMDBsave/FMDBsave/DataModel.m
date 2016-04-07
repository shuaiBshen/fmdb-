//
//  DataModel.m
//  FMDBsave
//
//  Created by 申帅 on 16/4/7.
//  Copyright © 2016年 申帅. All rights reserved.
//

#import "DataModel.h"
//数据库文件路径
#define DB_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.db"]
@implementation DataModel

+ (id)manager{
    static DataModel *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataModel alloc] init];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        [self commit];
    }
    return self;
}


- (void)commit{
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject];
    NSString *fileName=[doc stringByAppendingPathComponent:@"db.sqlite"];
    NSLog(@"%@",fileName);
    self.database = [FMDatabase databaseWithPath:fileName];
    if ([_database open]) {
         NSFileManager *fileManager = [NSFileManager defaultManager];
        if(![fileManager fileExistsAtPath:fileName]){
           [_database executeUpdate:@"CREATE TABLE bookmark (primary_key INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, content TEXT, url TEXT)"];
        }
        //如果要添加表 需下面创建 最好创建一个字段来比对系统版本来对应创建表
//        [_database executeUpdate:@"CREATE TABLE bookmark (primary_key INTEGER PRIMARY KEY AUTOINCREMENT, id TEXT, content TEXT, url TEXT)"];
    }
}
@end
