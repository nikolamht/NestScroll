//
//  MyTeamRootViewController.m
//  
//
//  Created by miaoht on 2018/4/8.
//  Copyright © 2018年 . All rights reserved.
//
#import "MyTeamRootViewController.h"
#import "MyTeamNaviBar.h"
#import "MyteamHeaderView.h"
#import "MyTeamSegmentViewController.h"
#import "MyTeamScrollerDelegate.h"
#import "UIScrollView+Direction.h"
#import "MYTableView.h"
#import <Masonry.h>
#import "UIColor+HexColor.h"
@interface MyTeamRootViewController ()<MyTeamScrollerDelegate>
{
    CGFloat header_offset;
}
@property(nonatomic , strong)MyteamHeaderView *headerView;
@property(nonatomic , strong)MyTeamSegmentViewController *segmentController;
@end
@implementation MyTeamRootViewController
#pragma mark - view
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
//    [self.navigationController setNavigationBarHidden:YES];
    [self layoutNavi];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor getColorFromHex:@"#1E2024"];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self layoutMain];
    [self layoutSegmentView];
}
- (void)layoutMain{
    header_offset = 0;
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@(0));
        make.height.equalTo(@(115));
    }];
}
- (void)layoutNavi {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navibar"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)layoutSegmentView {
    [self addChildViewController:self.segmentController];
    [self.view addSubview:self.segmentController.view];
    [self.segmentController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom);
        make.centerX.equalTo(self.headerView.mas_centerX);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.bottom.equalTo(self.view.mas_bottom).offset(-self.navigationController.tabBarController.tabBar.bounds.size.height);
    }];
}
#pragma mark - action
- (void)pushSetting:(UIButton *)btn {
//    [SNSRoute push:KROUTESCHEM vcString:KTestViewController param:nil];
}
#pragma mark - get&set
- (MyTeamSegmentViewController *)segmentController {
    if (!_segmentController) {
        _segmentController = [[MyTeamSegmentViewController alloc] init];
        _segmentController.delegate = self;
    }
    return _segmentController;
}
- (MyteamHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MyteamHeaderView alloc] init];
    }
    return _headerView;
}

#pragma mark - MyTeamScrollerDelegate
- (void)myteamscrollViewWillBeginDragging:(UIScrollView *)scrollView beginDraggingY:(CGFloat)draggingY beginDirection:(CGFloat)direction {
    MYTableView *myscrollView;
    if ([scrollView isKindOfClass:[MYTableView class]]) {
        myscrollView = (MYTableView *)scrollView;
    }
    if (!myscrollView) {
        return;
    }
    myscrollView.lastTranslationPointInView = [scrollView.panGestureRecognizer translationInView:scrollView.panGestureRecognizer.view].y;
    myscrollView.velocity = [scrollView.panGestureRecognizer velocityInView:scrollView.panGestureRecognizer.view].y;
    myscrollView.headerOffset = CGRectGetMinY(self.headerView.frame);
    myscrollView.beginDragingY = myscrollView.contentOffset.y;
    myscrollView.lastTranslationInView = 0;
}

- (void)myteamScrollViewDidScroll:(UIScrollView *)scrollView beginDraggingY:(CGFloat)draggingY beginDirection:(CGFloat)direction{
    MYTableView *myscrollView;
    if ([scrollView isKindOfClass:[MYTableView class]]) {
        myscrollView = (MYTableView *)scrollView;
    }
    if (!myscrollView) {
        return;
    }
    CGFloat velocity = [scrollView.panGestureRecognizer velocityInView:scrollView.panGestureRecognizer.view].y;
    CGFloat translation = [scrollView.panGestureRecognizer translationInView:scrollView.panGestureRecognizer.view].y;
    CGFloat y = myscrollView.contentOffset.y;
    if (myscrollView.velocity == 0) {//调整速度
        myscrollView.velocity = velocity;
    }
    //判断方向是否发生改变
    if (velocity*myscrollView.velocity<0) {//方向改变
        myscrollView.velocity = velocity;
        if (y <= 0 && velocity < 0) {
            myscrollView.lastTranslationInView = fabs(myscrollView.lastTranslationPointInView-translation);
        }
        myscrollView.lastTranslationPointInView = translation;
        myscrollView.headerOffset = CGRectGetMinY(self.headerView.frame);
        myscrollView.beginDragingY = scrollView.contentOffset.y;
    }
    translation = fabs(myscrollView.lastTranslationPointInView-translation);
    CGFloat headerMinY = CGRectGetMinY(self.headerView.frame);
    if (velocity < 0) {//向上drag
        if (headerMinY > -115 && y >= 0) {
            [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(MIN(MAX(myscrollView.headerOffset-(translation-myscrollView.lastTranslationInView), -115), 0));
                make.height.mas_equalTo(115);
            }];
            [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
    }
    if (velocity == 0) {//isdraging == NO
        if (y > myscrollView.beginDragingY) {//上滑
            if (headerMinY > -115) {
                [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.mas_equalTo(0);
                    make.top.mas_equalTo(MAX(myscrollView.headerOffset-translation, -115));
                    make.height.mas_equalTo(115);
                }];
                [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
            }
        }else{//下滑
            if (y <= 0) {
                [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.mas_equalTo(0);
                    make.top.mas_equalTo(MIN(fabs(y)-115, 0));
                    make.height.mas_equalTo(115);
                }];
            }
        }
    }
    if (velocity>0) {//向下drag
        if (headerMinY < 0 && y <= 0) {
            [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(MIN(myscrollView.headerOffset+translation-myscrollView.beginDragingY, 0));
                make.height.mas_equalTo(115);
            }];
            [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
    }
}
- (void)myteamscrollViewDidEndDragging:(UIScrollView *)scrollView beginDraggingY:(CGFloat)draggingY{
    MYTableView *myscrollView;
    if ([scrollView isKindOfClass:[MYTableView class]]) {
        myscrollView = (MYTableView *)scrollView;
    }
    if (!myscrollView) {
        return;
    }
    myscrollView.lastTranslationInView = 0;
    myscrollView.userInteractionEnabled = NO;
    CGFloat headerMaxY = CGRectGetMaxY(self.headerView.frame);
    [self.view setNeedsUpdateConstraints];
    if (headerMaxY >= 57.5) {
        [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(115);
            make.top.mas_equalTo(0);
        }];
    }else {
        [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(115);
            make.top.mas_equalTo(-115);
        }];
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        myscrollView.userInteractionEnabled = YES;
    }];
}
#pragma mark - system
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
