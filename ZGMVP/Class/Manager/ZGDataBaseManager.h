//
//  ZGDataBaseManager.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/16.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#define NULLABLE(value) (value!=nil?value:[NSNull null])
@interface ZGDataBaseManager : NSObject
@property(nonatomic,strong,readonly)FMDatabaseQueue*dbQueue;
/**
 单例
 */
+(instancetype)shareInstance;
@end
