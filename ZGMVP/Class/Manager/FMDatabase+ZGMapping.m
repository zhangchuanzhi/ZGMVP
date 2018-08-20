//
//  FMDatabase+ZGMapping.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/16.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "FMDatabase+ZGMapping.h"
#import "FMDatabaseAdditions.h"
#import "RXCollection.h"
@implementation FMDatabase (ZGMapping)
-(BOOL)createTable:(NSString *)aTable columns:(NSDictionary *)arguments
{
    NSMutableArray*keys=[arguments allKeys].mutableCopy;
    NSString*columnsDescription=[[keys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@"'%@' %@",key,arguments[key]];
    }]componentsJoinedByString:@", "];
    NSString*SQL=[NSString stringWithFormat:@"CREATE TABLE '%@' (%@)",aTable,columnsDescription];
    return [self executeUpdate:SQL];
}
-(BOOL)createTable:(NSString *)aTable columns:(NSDictionary *)arguments PrimaryKey:(NSArray *)pkeys
{
    NSArray*keys=[arguments allKeys];
    NSString*columnsDescription=[[keys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@"'%@' %@",key,arguments[key]];
    }]componentsJoinedByString:@", "];
    NSString*pkey=[[pkeys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@"'%@'",key];
    }]componentsJoinedByString:@", "];
    NSString*SQL=[NSString stringWithFormat:@"CREATE TABLE '%@' (%@,PRIMARY KEY (%@))",aTable,columnsDescription,pkey];
    return [self executeUpdate:SQL];
}
-(BOOL)createTableIfNotExists:(NSString *)aTable columns:(NSDictionary *)arguments
{
    if([self tableExists:aTable])return YES;
    return [self createTable:aTable columns:arguments];
}
-(BOOL)executeInsertInTable:(NSString *)aTable withParameterDictionary:(NSDictionary *)arguments
{
    NSArray*keys=[arguments allKeys];
    NSString*columns=[[keys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@"'%@'",key];
    }]componentsJoinedByString:@", "];
    NSString*params=[[keys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@":%@",key];
    }]componentsJoinedByString:@", "];
    NSString*SQL=[NSString stringWithFormat:@"INSERT INTO '%@' (%@) VALUES (%@)",aTable,columns,params];
    return [self executeUpdate:SQL withParameterDictionary:arguments];
}
-(BOOL)executeInsertOrReplaceInTable:(NSString *)aTable withParameterDictionary:(NSDictionary *)arguments
{
    NSArray*keys=[arguments allKeys];
    NSString*columns=[[keys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@"'%@'",key];
    }]componentsJoinedByString:@", "];
    NSString*params=[[keys rx_mapWithBlock:^id(id key) {
        return [NSString stringWithFormat:@":%@",key];
    }]componentsJoinedByString:@", "];
    NSString*sql=[NSString stringWithFormat:@"INSERT OR REPLACE INTO '%@' (%@) VALUES (%@)",aTable,columns,params];
    return [self executeUpdate:sql withParameterDictionary:arguments];
}
-(FMResultSet *)executeQueryInTable:(NSString *)aTable columns:(NSArray *)columns where:(NSString *)where parameters:(NSDictionary *)arguments
{
    NSString*SQL=[NSString stringWithFormat:@"SELECT %@ FROM '%@' %@",columns?[columns componentsJoinedByString:@", "]:@"*",aTable,where?where:@""];
    return [self executeQuery:SQL withParameterDictionary:arguments];
}
@end
@implementation FMResultSet (ZGMapping)
-(NSArray *)mapToArrayOfClass:(Class)ocClass
{
    return [self mapToArrayOfClass:ocClass propertyMapping:nil];
}
-(NSArray *)mapToArrayOfClass:(Class)ocClass propertyMapping:(NSDictionary *)columnToPropertyMap
{
    if(columnToPropertyMap==nil)columnToPropertyMap=@{};
    NSMutableArray*result=[[NSMutableArray alloc]init];
    while ([self next]) {
        id object=[[ocClass alloc]init];
        [result addObject:object];
        NSDictionary*columnNameToIndexMap=[self columnNameToIndexMap];
        __weak typeof(self) weak_self=self;
        __weak typeof(columnToPropertyMap) weak_columnToPropertyMap=columnToPropertyMap;
        __weak typeof(object)weak_object=object;
        [columnNameToIndexMap enumerateKeysAndObjectsUsingBlock:^(NSString*columnName, NSNumber*index, BOOL * _Nonnull stop) {
            //没有映射，则使用列名作为属性
            __strong typeof(self) self=weak_self;
            __strong typeof(columnToPropertyMap) propertyMap=weak_columnToPropertyMap;
            __strong typeof(object)object =weak_object;
            NSString*mappedPropertyName=propertyMap[columnName]?propertyMap[columnName]:columnName;
            if ([object respondsToSelector:NSSelectorFromString(mappedPropertyName)]&&![@"description" isEqualToString:mappedPropertyName]) {
                id value=self[columnName];
                if (![value isEqual:[NSNull null]]) {
                    [object setValue:value forKey:mappedPropertyName];
                }
            }
        }];
    }
    return result;
}
-(id)mapToObjectOfClass:(Class)ocClass
{
    return [self mapToObjectOfClass:ocClass propertyMapping:nil];
}
-(id)mapToObjectOfClass:(Class)ocClass propertyMapping:(NSDictionary *)columnToPropertyMap
{
    NSArray *result=[self mapToObjectOfClass:ocClass propertyMapping:columnToPropertyMap];
    NSAssert([result count]<=1,@"result is not unique,size:%@", @([result count]));
    return [result count]==1?result[0]:nil;
}
@end
