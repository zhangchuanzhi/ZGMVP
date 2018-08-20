//
//  ZGMinePresenter.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGMinePresenter.h"
#import "ZGMineModel.h"
#import "HKHTTPResponse.h"
@implementation ZGMinePresenter
-(void)getMineInfoWithURLString:(NSString *)URLString param:(NSDictionary *)param
{
    [self.httpClient get:URLString parameters:param];
}
-(void)onSuccess:(id)responseObject
{
    HKHttpResponse*responseObj=(HKHttpResponse*)responseObject;
    ZGMineModel*model=[ZGMineModel yy_modelWithJSON:responseObj.content];
    if ([_view respondsToSelector:@selector(onGetMineInfoSuccess:)]) {
        [_view onGetMineInfoSuccess:model];
    }
}
-(void)onFail:(id)clientInfo errCode:(NSInteger)errCode errInfo:(NSString *)errInfo
{
    if ([_view respondsToSelector:@selector(onGetMineInfoFail:des:)]) {
        [_view onGetMineInfoFail:errCode des:errInfo];
    }
}
@end
