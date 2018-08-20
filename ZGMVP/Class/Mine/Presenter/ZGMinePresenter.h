//
//  ZGMinePresenter.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGHttpPresenter.h"
#import "ZGMineViewProtocol.h"
@interface ZGMinePresenter : ZGHttpPresenter<id<ZGMineViewProtocol>>
-(void)getMineInfoWithURLString:(NSString*)URLString param:(NSDictionary*)param;
@end
