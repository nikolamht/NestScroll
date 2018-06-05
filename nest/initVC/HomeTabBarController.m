//
//  HomeTabBarController.m
//  
//
//  Created by miaoht on 2018/4/8.
//  Copyright © 2018年 . All rights reserved.
//

#import "HomeTabBarController.h"
#import "MyTeamRootViewController.h"//
#import "MySeasonRootViewController.h"//
#import "CompetitorRootViewController.h"//
#import "RankingRootViewController.h"//

@interface HomeTabBarController ()

@end

@implementation HomeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutUI];
}

- (void)layoutUI {
    [self setUpTabBarAppearance];
    //设置我的球队
    UINavigationController *myTeamNavi = [self setUpTabsWithController:[[MyTeamRootViewController alloc] init]];
    //设置我的赛程
    UINavigationController *mySeasonNavi = [self setUpTabsWithController:[[MySeasonRootViewController alloc] init]];
    //设置对手分析
    UINavigationController *CompetitorNavi = [self setUpTabsWithController:[[CompetitorRootViewController alloc] init]];
    //设置榜单
    UINavigationController *RankingNavi = [self setUpTabsWithController:[[RankingRootViewController alloc] init]];
    
    self.viewControllers = [[NSArray alloc] initWithObjects:myTeamNavi,mySeasonNavi,CompetitorNavi,RankingNavi,nil];
    self.selectedIndex = 0;
}

- (void)setUpTabBarAppearance {
    //title向上-4
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -5)];
    //设置tabbar的背景色
    CALayer *colorLayer = [CALayer new];
    colorLayer.frame = CGRectMake(0, 0, self.tabBar.bounds.size.width, self.tabBar.bounds.size.height);
    colorLayer.backgroundColor = [UIColor getColorFromHex:@"#21282D"].CGColor;
    [self.tabBar.layer insertSublayer:colorLayer atIndex:0];
    //设置tabbar的线条颜色
    CALayer *lineLayer = [CALayer new];
    lineLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 1);
    lineLayer.backgroundColor = [UIColor getColorFromHex:@"#1E2024"].CGColor;
    [self.tabBar.layer addSublayer:lineLayer];
    [self.tabBar setBackgroundImage:[UIImage new]];
}

- (UINavigationController *)setUpTabsWithController:(UIViewController *)controller{
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controller];
    
    NSString *imgName;
    NSString *imgSelName;
    NSString *title;
    
    if ([controller isKindOfClass:[MyTeamRootViewController class]]) {
        imgName = @"tab_myTeam";
        imgSelName = @"tab_myTeamSel";
        title = @"首页";
    }
    
    if ([controller isKindOfClass:[MySeasonRootViewController class]]) {
        imgName = @"tab_mySeason";
        imgSelName = @"tab_mySeasonSel";
        title = @"首页";
    }
    
    if ([controller isKindOfClass:[CompetitorRootViewController class]]) {
        imgName = @"tab_competitor";
        imgSelName = @"tab_competitorSel";
        title = @"首页";
    }
    
    if ([controller isKindOfClass:[RankingRootViewController class]]) {
        imgName = @"tab_ranking";
        imgSelName = @"tab_rankingSel";
        title = @"首页";
    }
    
    UIImage *img = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *imgSel = [[UIImage imageNamed:imgSelName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:title image:img selectedImage:imgSel];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor getColorFromHex:@"#7F97AB"]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor getColorFromHex:@"#31BEF9"]} forState:UIControlStateSelected];
    navi.tabBarItem = item;
    return navi;
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
