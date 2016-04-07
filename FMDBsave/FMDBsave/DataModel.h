//
//  DataModel.h
//  FMDBsave
//
//  Created by 申帅 on 16/4/7.
//  Copyright © 2016年 申帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DataModel : NSObject

@property(strong, nonatomic)FMDatabase *database;



+ (id) manager;
@end
