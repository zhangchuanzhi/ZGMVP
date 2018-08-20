//
//  ZGMineController.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/17.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGMineController.h"
#import "ZGMineMainView.h"
@interface ZGMineController ()
@property(nonatomic,strong)ZGMineMainView*mainView;
@end

@implementation ZGMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainView];
}
-(ZGMineMainView *)mainView
{
    if (!_mainView) {
        _mainView=[[ZGMineMainView alloc]initWithFrame:CGRectZero];
    }
    return _mainView;
}

@end
