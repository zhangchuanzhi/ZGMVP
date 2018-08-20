//
//  ZGPresenter.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGPresenter<E> : NSObject
{
    __weak E _view;
}
/**
 初始化函数

 @param view 要绑定的视图
 */
-(instancetype)initWithView:(E)view;
/**
 绑定试图

 @param view 要绑定的视图
 */
-(void)attachView:(E)view;
/**
 解绑视图
 */
-(void)detachView;
@end
