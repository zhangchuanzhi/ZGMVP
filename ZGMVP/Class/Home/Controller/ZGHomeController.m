//
//  ZGHomeController.m
//  ZGMVP
//
//  Created by offcn_zcz32036 on 2018/8/20.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGHomeController.h"
#import "ZGHomePresenter.h"
#import "ZGHomeProtocol.h"
#import "ZGHomeMainView.h"
@interface ZGHomeController ()<ZGHomeProtocol>
@property(nonatomic,strong)ZGHomePresenter*homePresenter;
@property(nonatomic,strong)ZGHomeMainView*homeMainView;
@end

@implementation ZGHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.homeMainView];
    [self requestData];

}
-(void)requestData
{
    [self.homePresenter getMovieListWithUrlString:@"satinApi" param:@{@"type":@"1",
                                                                      @"page":@"1"}];
}
-(void)onGetMovieListSuccess:(id)model
{
    //同一个presenter如果存在多个回调，可以通过Model的类型来判断回调
    if ([model isKindOfClass:[ZGHomeModel class]]) {
        [self.homeMainView configViewWithHomeModel:model];
    }else if([model isKindOfClass:[ZGHomeBannerModel class]]){

    }
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:@"result" message:@"request success" preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:alertCtl animated:YES completion:nil];
}
-(void)onGetMovieListFail:(NSInteger)errorCode des:(NSString *)des
{
    [self.homeMainView showErrorView];
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:@"result" message:@"request fail" preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:alertCtl animated:YES completion:nil];
}
#pragma mark - lazy load
- (ZGHomeMainView *)homeMainView{
    if (!_homeMainView) {
        _homeMainView = [[ZGHomeMainView alloc] initWithFrame:CGRectZero];
    }
    return _homeMainView;
}
- (ZGHomePresenter *)homePresenter{
    if (!_homePresenter) {
        _homePresenter = [[ZGHomePresenter alloc] initWithView:self];
    }
    return _homePresenter;
}
@end
