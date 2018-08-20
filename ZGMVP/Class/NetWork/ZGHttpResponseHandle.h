//
//  ZGHttpResponseHandle.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZGHttpResponseHandle <NSObject>
@required
/**
 响应成功

 @param responseObject 返回的数据
 */
-(void)onSuccess:(id)responseObject;
/**
 响应失败

 @param clientInfo 返回的数据
 @param errCode 业务错误码
 @param errInfo 错误信息
 */
-(void)onFail:(id)clientInfo
      errCode:(NSInteger)errCode
      errInfo:(NSString*)errInfo;
@end
