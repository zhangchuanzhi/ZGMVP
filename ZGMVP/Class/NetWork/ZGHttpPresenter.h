//
//  ZGHttpPresenter.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGPresenter.h"
#import "ZGHttpResponseHandle.h"
#import "ZGHttpClient.h"
@interface ZGHttpPresenter<E> : ZGPresenter<E><ZGHttpResponseHandle>
@property(nonatomic,strong)ZGHttpClient*httpClient;
@end
