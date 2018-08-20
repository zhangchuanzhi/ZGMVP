//
//  FMDatabase+ZGMapping.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/16.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "FMDatabase.h"

@interface FMDatabase (ZGMapping)

-(BOOL)createTable:(NSString*)aTable columns:(NSDictionary*)arguments;

-(BOOL)createTable:(NSString *)aTable columns:(NSDictionary *)arguments PrimaryKey:(NSArray*)pkeys;

-(BOOL)createTableIfNotExists:(NSString*)aTable columns:(NSDictionary*)arguments;

-(BOOL)executeInsertInTable:(NSString*)aTable withParameterDictionary:(NSDictionary*)arguments;

-(BOOL)executeInsertOrReplaceInTable:(NSString *)aTable withParameterDictionary:(NSDictionary *)arguments;

-(FMResultSet*)executeQueryInTable:(NSString*)aTable columns:(NSArray*)columns where:(NSString*)where parameters:(NSDictionary*)arguments;

@end

@interface FMResultSet(ZGMapping)

-(NSArray*)mapToArrayOfClass:(Class)ocClass;

-(NSArray*)mapToArrayOfClass:(Class)ocClass propertyMapping:(NSDictionary*)columnToPropertyMap;

-(id)mapToObjectOfClass:(Class)ocClass;

-(id)mapToObjectOfClass:(Class)ocClass propertyMapping:(NSDictionary*)columnToPropertyMap;
@end
