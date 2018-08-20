//
//  ZGHomeProtocol.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/20.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZGHomeProtocol <NSObject>
-(void)onGetMovieListSuccess:(id)model;
-(void)onGetMovieListFail:(NSInteger)errorCode des:(NSString*)des;
@end
