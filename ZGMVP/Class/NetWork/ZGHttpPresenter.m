//
//  ZGHttpPresenter.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGHttpPresenter.h"

@implementation ZGHttpPresenter
- (instancetype)initWithView:(id)view
{
    self=[super initWithView:view];
    if (self) {
        _httpClient=[[ZGHttpClient alloc]initWithHandle:self];
    }
    return self;
}

-(void)onSuccess:(id)responseObject{}

-(void)onFail:(id)clientInfo errCode:(NSInteger)errCode errInfo:(NSString *)errInfo{}
@end
