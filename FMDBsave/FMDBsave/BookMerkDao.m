//
//  BookMerkDao.m
//  h5
//
//  Created by new on 15/9/17.
//  Copyright (c) 2015年 尚娱网络. All rights reserved.
//

#import "BookMerkDao.h"
#import "DataModel.h"

#define DB   [[DataModel manager] database]

@implementation BookMerkDao

+ (BOOL)hasMessage:(NSString *)BookmarkContent {
    
    FMResultSet *rs = [DB executeQuery:@"select * from bookmark where content=?",BookmarkContent];
    return [rs next];
}
+ (NSDictionary*)resultSetToDictionary:(FMResultSet*)rs {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSString *id = [rs stringForColumn:@"id"];
    NSString *content = [rs stringForColumn:@"content"];
    NSString *BookUrl = [rs stringForColumn:@"url"];
    if (id) {
        dictionary[@"id"] = id;
    }
    if (content) {
        dictionary[@"content"] = content;
    }
    if (BookUrl) {
        dictionary[@"url"] = BookUrl;
    }
    
    return dictionary;
}
//查找
+ (NSArray *)findAllBookMark {
    FMResultSet *rs = [DB executeQuery:@"select * from bookmark order by primary_key desc"];
    NSMutableArray *result = [NSMutableArray array];
    while ([rs next]) {
        [result insertObject:[self resultSetToDictionary:rs] atIndex:0];
    }
    return result;
}
//保存
+ (void)saveBookmark:(NSDictionary *)BookmarkData{
    NSString *id = BookmarkData[@"id"];
    NSString *content = BookmarkData[@"content"];
    NSString *bookUrl = BookmarkData[@"url"];
    //防止重复添加
    if (![BookMerkDao hasMessage:content]) {
        [DB executeUpdate:@"insert into bookmark (id,content,url) values (?,?,?)",id,content,bookUrl];
    }
}
//删除
+ (void)deleteBookmark:(NSDictionary *)content{
    NSString *id = content[@"id"];
    [DB executeUpdate:@"delete from bookmark where id=?",id];
}
//更新
+ (void)updeteBookmark:(NSDictionary *)content{
    NSString *id = content[@"id"];
    NSString *contents = content[@"content"];
    [DB executeUpdate:@"update bookmark set content=? where id=?",contents,id];
    NSLog(@"更新%@,%@",contents,id);
}
@end
