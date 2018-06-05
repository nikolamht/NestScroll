//
//  MyTeamSegmentViewController.m
//  
//
//  Created by miaoht on 2018/4/11.
//  Copyright © 2018年 . All rights reserved.
//

#import "MyTeamSegmentViewController.h"
#import "HMSegmentedControl.h"
#import "MyTeamPlayersViewController.h"
#import "MyTeamContainerViewDelegate.h"
@interface MyTeamSegmentViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,MyTeamContainerViewDelegate>
@property(nonatomic , strong)HMSegmentedControl *segmentView;
@property(nonatomic , strong)UIPageViewController *pageController;
@end

@implementation MyTeamSegmentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor getColorFromHex:@"#1E2024"];
    [self layoutMain];
}
- (void)layoutMain{
    [self.view addSubview:self.segmentView];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.height.equalTo(@(36));
    }];
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
    [self.pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentView.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(@(self.view.bounds.size.width));
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
#pragma mark - control
- (void)setPageIndex:(NSUInteger)pageIndex {
    if (pageIndex >= self.viewControllers.count) {
        return;
    }
    MyTeamPlayersViewController *playersController = (MyTeamPlayersViewController *)[self.viewControllers objectAtIndex:pageIndex];
    NSArray *array = [NSArray arrayWithObjects:playersController, nil];
    [self.pageController setViewControllers:array
                                  direction:pageIndex>_pageIndex?UIPageViewControllerNavigationDirectionForward:UIPageViewControllerNavigationDirectionReverse
                               animated:YES
                             completion:NULL];
    _pageIndex = pageIndex;
}
#pragma mark - 点击segment
-(void)segmentControlValueChanged:(HMSegmentedControl *)seg {
    [self setPageIndex:seg.selectedSegmentIndex];
}
#pragma mark - UIPageViewControllerDelegate,UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self.viewControllers objectAtIndex:index];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound)
    {
        return nil;
    }
    index++;
    if (index >= self.viewControllers.count)
    {
        return nil;
    }
    return [self.viewControllers objectAtIndex:index];
}
-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.viewControllers.count;
}
-(UIInterfaceOrientationMask)pageViewControllerSupportedInterfaceOrientations:(UIPageViewController *)pageViewController {
    return UIInterfaceOrientationMaskPortrait;
}
#pragma mark - MyTeamContainerViewDelegate
- (void)myTeamContainerViewDidChange:(UIViewController *)controller {
    NSInteger index = [self.viewControllers indexOfObject:controller];
    [self.segmentView setSelectedSegmentIndex:index animated:YES];
}
#pragma mark - get&set
- (UIPageViewController *)pageController {
    if (!_pageController) {
        NSDictionary *options =[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey: UIPageViewControllerOptionSpineLocationKey];
        _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        _pageController.delegate = self;
        _pageController.dataSource = self;
        _pageController.doubleSided = NO;
        MyTeamPlayersViewController *playersController = (MyTeamPlayersViewController *)[self.viewControllers firstObject];
        NSArray *array = [NSArray arrayWithObjects:playersController, nil];
        [_pageController setViewControllers:array
                                   direction:UIPageViewControllerNavigationDirectionForward
                                    animated:YES
                                  completion:NULL];
    }
    return _pageController;
}
- (HMSegmentedControl *)segmentView {
    if (!_segmentView) {
        _segmentView = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"内容",@"内容",@"内容",@"内容",@"内容",@"内容"]];
        _segmentView.alignment = HMSegmentedControlSegmentAlignmentLeft;
        _segmentView.backgroundColor = [UIColor getColorFromHex:@"#21282D"];
        _segmentView.segmentEdgeInset = UIEdgeInsetsMake(0, 15, 0, 15);
        _segmentView.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleDynamic;
        UIFont * font = [UIFont systemFontOfSize:15.0f];
        _segmentView.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:font};
        _segmentView.DynamicSpace = 50.0f;
        _segmentView.DynamicHeaderTailer = 15.f;
        _segmentView.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1],NSFontAttributeName:font};
        _segmentView.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        _segmentView.selectionIndicatorHeight = 1.0f;
        _segmentView.selectionIndicatorColor = [UIColor whiteColor];
        _segmentView.frame = CGRectMake(0, 60, self.view.bounds.size.width, 25);
        [_segmentView addTarget:self action:@selector(segmentControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentView;
}
- (NSMutableArray *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [[NSMutableArray alloc] init];
        MyTeamPlayersViewController *playersController;
        playersController = [[MyTeamPlayersViewController alloc] init];
        playersController.delegate = self.delegate;
        playersController.containerDelegate = self;
        [_viewControllers addObject:playersController];
        playersController = [[MyTeamPlayersViewController alloc] init];
        playersController.delegate = self.delegate;
        playersController.containerDelegate = self;
        [_viewControllers addObject:playersController];
        playersController = [[MyTeamPlayersViewController alloc] init];
        playersController.delegate = self.delegate;
        playersController.containerDelegate = self;
        [_viewControllers addObject:playersController];
        playersController = [[MyTeamPlayersViewController alloc] init];
        playersController.delegate = self.delegate;
        playersController.containerDelegate = self;
        [_viewControllers addObject:playersController];
        playersController = [[MyTeamPlayersViewController alloc] init];
        playersController.delegate = self.delegate;
        playersController.containerDelegate = self;
        [_viewControllers addObject:playersController];
        playersController = [[MyTeamPlayersViewController alloc] init];
        playersController.delegate = self.delegate;
        playersController.containerDelegate = self;
        [_viewControllers addObject:playersController];
    }
    return _viewControllers;
}
#pragma mark - system
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
