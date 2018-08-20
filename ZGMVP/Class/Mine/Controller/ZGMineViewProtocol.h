//
//  ZGMineViewProtocol.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGMineModel.h"
@protocol ZGMineViewProtocol <NSObject>
-(void)onGetMineInfoSuccess:(ZGMineModel*)model;
-(void)onGetMineInfoFail:(NSInteger)errorCode des:(NSString*)des;
@end
