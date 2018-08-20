//
//  ZGHttpClient.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ZGHttpResponseHandle;
@interface ZGHttpClient : NSObject
-(instancetype)initWithHandle:(id<ZGHttpResponseHandle>)responseHandle;
/**
 POST请求

 @param URLString 路径
 @param parameters 参数
 @return 请求id
 */
-(NSString*)post:(NSString*)URLString parameters:(id)parameters;
/**
 GET请求

 @param URLString 路径
 @param parameters 参数
 @return 请求id
 */
-(NSString*)get:(NSString*)URLString parameters:(id)parameters;
@end
