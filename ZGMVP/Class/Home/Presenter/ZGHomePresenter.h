//
//  ZGHomePresenter.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/20.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGHttpPresenter.h"
#import "ZGHomeProtocol.h"
#import "ZGHomeModel.h"
#import "ZGHomeBannerModel.h"
@interface ZGHomePresenter : ZGHttpPresenter<id<ZGHomeProtocol>>
-(void)getMovieListWithUrlString:(NSString*)urlString param:(NSDictionary*)param;
@end
