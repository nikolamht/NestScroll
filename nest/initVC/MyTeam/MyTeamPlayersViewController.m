//
//  MyTeamPlayersViewController.m
//  
//
//  Created by miaoht on 2018/4/11.
//  Copyright © 2018年 . All rights reserved.
//

#import "MyTeamPlayersViewController.h"
#import "MyTeamPlayerCellTableViewCell.h"
#import "MyTeamHeaderCell.h"
#import "MYTableView.h"
@interface MyTeamPlayersViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat beginDragingY;
    CGFloat velocity;
}
@property(nonatomic , strong)MYTableView *mytableView;
@end
@implementation MyTeamPlayersViewController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.containerDelegate) {
        __weak typeof(self) weakself = self;
        [self.containerDelegate myTeamContainerViewDidChange:weakself];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor getColorFromHex:@"#1E2024"];
    [self layoutMain];
}
- (void)layoutMain {
    [self.view addSubview:self.mytableView];
    [self.mytableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid =@"cellid";
    MyTeamPlayerCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[MyTeamPlayerCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    static NSString *headerid = @"headerid";
    MyTeamHeaderCell *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerid];
    if (!view) {
        view = [[MyTeamHeaderCell alloc] initWithReuseIdentifier:headerid];
    }
    return view;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.delegate) {
        [self.delegate myteamscrollViewWillBeginDragging:scrollView beginDraggingY:beginDragingY beginDirection:velocity];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.delegate&&!scrollView.isDragging) {
        [self.delegate myteamscrollViewDidEndDragging:scrollView beginDraggingY:beginDragingY ];
        return;
    }
    if (self.delegate) {
        [self.delegate myteamScrollViewDidScroll:scrollView beginDraggingY:beginDragingY beginDirection:velocity];
        return;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.delegate) {
        [self.delegate myteamscrollViewDidEndDragging:scrollView beginDraggingY:beginDragingY];
    }
}
#pragma mark - get&set
- (UITableView *)mytableView {
    if (!_mytableView) {
        _mytableView = [[MYTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mytableView.backgroundColor = [UIColor getColorFromHex:@"#1E2024"];
        _mytableView.delegate = self;
        _mytableView.dataSource = self;
        _mytableView.separatorColor = [UIColor getColorFromHex:@"#333D46"];
    }
    return _mytableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
