//
//  ZGPresenter.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGPresenter.h"

@implementation ZGPresenter
-(instancetype)initWithView:(id)view
{
    self=[super init];
    if (self) {
        _view=view;
    }
    return self;
}
/**
 绑定视图

 @param view 要绑定的视图
 */
-(void)attachView:(id)view
{
    _view=view;
}
-(void)detachView
{
    _view=nil;
}
@end
