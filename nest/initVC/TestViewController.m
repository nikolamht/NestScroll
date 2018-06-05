//
//  TestViewController.m
//  ApocalypseiOS
//
//  Created by StephenZhu on 2018/4/4.
//  Copyright © 2018年 SuningSports. All rights reserved.
//

#import "TestViewController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)openDevMode
{
    [SNSRoute push:KROUTESCHEM vcString:KDebugConfigViewController param:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
