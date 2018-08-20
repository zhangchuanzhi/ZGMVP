//
//  ZGHomePresenter.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/20.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGHomePresenter.h"
#import "HKHttpResponse.h"
@implementation ZGHomePresenter
-(void)getMovieListWithUrlString:(NSString *)urlString param:(NSDictionary *)param
{
    [self.httpClient get:urlString parameters:param];
}
-(void)onSuccess:(id)responseObject
{
    HKHttpResponse*responseObj=(HKHttpResponse*)responseObject;
    if ([responseObj.request.URL.absoluteString hasSuffix:@"satinApi"]) {
        ZGHomeModel*model=[ZGHomeModel yy_modelWithJSON:responseObj.content];
        if ([_view respondsToSelector:@selector(onGetMovieListSuccess:)]) {
            [_view onGetMovieListSuccess:model];
        }
    }else
    {
        ZGHomeBannerModel*model=[ZGHomeBannerModel yy_modelWithJSON:responseObj.content];
        if ([_view respondsToSelector:@selector(onGetMovieListSuccess:)]) {
            [_view onGetMovieListSuccess:model];
        }
    }
}
-(void)onFail:(id)clientInfo errCode:(NSInteger)errCode errInfo:(NSString *)errInfo
{
    if ([_view respondsToSelector:@selector(onGetMovieListFail:des:)]) {
        [_view onGetMovieListFail:errCode des:errInfo];
    }
}
@end
