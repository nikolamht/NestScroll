//
//  ViewController.m
//  ApocalypseiOS
//
//  Created by StephenZhu on 2018/4/4.
//  Copyright © 2018年 SuningSports. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (nonatomic,strong) UIButton *pushButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pushButton];
    [self layoutMain];
}
- (void)layoutMain
{
    [self.pushButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushView
{
//    [LoginProvider getCheckCodeWithPhone:@"18652001254" vCode:@"111111" success:^(LoginProvider *request) {
//        [SNSRoute push:KROUTESCHEM vcString:KTestViewController param:nil];
//    } failure:^(SNSRequest *request) {
//        ;
//    } animated:YES loadingText:nil inView:self.view];
//    
    
}
#pragma mark - init views
- (UIButton *)pushButton
{
    if (_pushButton == nil) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pushButton setTitle:@"button" forState:UIControlStateNormal];
        _pushButton.backgroundColor = [UIColor greenColor];
        [_pushButton addTarget:self action:@selector(pushView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}
@end
