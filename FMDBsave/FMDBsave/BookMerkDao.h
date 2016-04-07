//
//  BookMerkDao.h
//  h5
//
//  Created by new on 15/9/17.
//  Copyright (c) 2015年 尚娱网络. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookMerkDao : NSObject

/**
 *   查找所有的消息数据
 *
 *   @return 返回所有消息数据数组
 */
+ (NSArray *)findAllBookMark;

/**
 *   保存一个书签数据到数据库中
 *
 *
 */
+ (void)saveBookmark:(NSDictionary *)BookmarkData;
/**
 *   从数据库中删除书签
 *
 *
 */
+ (void)deleteBookmark:(NSDictionary *)content;
/**
 *
 * 通过id更新数据库
 *
 */
+ (void)updeteBookmark:(NSDictionary *)content;
@end
