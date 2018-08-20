//
//  ZGHttpClient.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGHttpClient.h"
#import "AFNetworking.h"
#import "ZGHttpResponseHandle.h"
#import "HKHttpManagerHeader.h"
@interface ZGHttpClient()
@property(nonatomic,weak)id<ZGHttpResponseHandle> responseHandle;
@end
@implementation ZGHttpClient
-(instancetype)initWithHandle:(id<ZGHttpResponseHandle>)responseHandle
{
    self=[super init];
    if (self) {
        //指定delegate
        _responseHandle=responseHandle;
        [HKHttpConfigure shareInstance].generalServer=@"https://www.apiopen.top/";
    }
    return self;
}
-(NSString *)post:(NSString *)URLString parameters:(id)parameters
{
     __weak typeof(self) weak_self=self;
    NSString *requestId=[[HKHttpManager shareManager]sendRequestWithConfigBlock:^(HKHttpRequest * _Nullable request) {
        request.requestURL=URLString;
        request.requestMethod=HKHttpRequestTypePost;
        request.normalParams=parameters;
    } complete:^(HKHttpResponse * _Nullable response) {
         __strong typeof(self) strongSelf=weak_self;
        if (response.status==HKHttpResponseStatusSuccess) {
            if ([strongSelf.responseHandle respondsToSelector:@selector(onSuccess:)]) {
                [strongSelf.responseHandle onSuccess:response];
            }else
            {
                if ([strongSelf.responseHandle respondsToSelector:@selector(onFail:errCode:errInfo:)]) {
                    [strongSelf.responseHandle onFail:parameters errCode:response.statueCode errInfo:response.content];
                }
            }
        }

    }];
    return requestId;
}
-(NSString *)get:(NSString *)URLString parameters:(id)parameters
{
     __weak typeof(self) weak_self=self;
    NSString*requestId=[[HKHttpManager shareManager]sendRequestWithConfigBlock:^(HKHttpRequest * _Nullable request) {
        request.requestURL=URLString;
        request.requestMethod=HKHttpRequestTypeGet;
        request.normalParams=parameters;
    } complete:^(HKHttpResponse * _Nullable response) {
        __strong typeof(self) strongSelf=weak_self;
        if (response.status==HKHttpResponseStatusSuccess) {
            if ([strongSelf.responseHandle respondsToSelector:@selector(onSuccess:)]) {
                [strongSelf.responseHandle onSuccess:response];
            }else
            {
                if ([strongSelf.responseHandle respondsToSelector:@selector(onFail:errCode:errInfo:)]) {
                    [strongSelf.responseHandle onFail:parameters errCode:response.statueCode errInfo:response.content];
                }
            }
        }
    }];
    return requestId;
}
@end
