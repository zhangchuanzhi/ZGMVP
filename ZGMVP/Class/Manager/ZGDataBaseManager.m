//
//  ZGDataBaseManager.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/16.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGDataBaseManager.h"

@implementation ZGDataBaseManager
/**
 单例
 */
+(instancetype)shareInstance
{
    static ZGDataBaseManager*sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance=[[self alloc]init];
    });
    return sharedInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initDataBase];
    }
    return self;
}
/**
 初始化
 */
-(void)initDataBase
{
    long long userId;
    //数据库路径
    NSString*path=[[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"sunshineHealthy"]stringByAppendingPathComponent:[NSString stringWithFormat:@"%llu",userId]];
    //创建数据库保存路径
    if (![[NSFileManager defaultManager]fileExistsAtPath:path isDirectory:NULL]) {
        NSError*error=nil;
        [[NSFileManager defaultManager]createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSString*dbPath=[path stringByAppendingString:@"sunshineHealthy.sqlite"];
    //数据库队列
    _dbQueue=[[FMDatabaseQueue alloc]initWithPath:dbPath];
}
@end
