//
//  ZGHomeMainView.h
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/20.
//  Copyright © 2018年 cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGHomeModel;
@interface ZGHomeMainView : UIView
/**
 配置页面
 */
-(void)configViewWithHomeModel:(ZGHomeModel*)model;
/**
 错误页面
 */
-(void)showErrorView;
@end
