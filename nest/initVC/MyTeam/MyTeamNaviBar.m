//
//  MyTeamNaviBar.m
//  
//
//  Created by miaoht on 2018/4/8.
//  Copyright © 2018年 . All rights reserved.
//

#import "MyTeamNaviBar.h"
#import <Masonry.h>
@interface MyTeamNaviBar()
@property(nonatomic , strong)UIImageView *bgView;
@property(nonatomic , strong)UIButton *titleBtn;
@property(nonatomic , strong)UIButton *rightBtn;
@property(nonatomic , strong)UIImage  *selectIcon;
@end
@implementation MyTeamNaviBar

- (instancetype)init{
    self = [super init];
    if (!self) { return nil; }
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    [self addSubview:self.bgView];
    [self addSubview:self.leftBtn];
    [self addSubview:self.titleBtn];
    [self addSubview:self.rightBtn];
    [self layoutMain];
    return self;
}

- (void)layoutMain {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self);
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.top.equalTo(self.mas_top).offset([[UIApplication sharedApplication] statusBarFrame].size.height+10);
    }];
    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.leftBtn.mas_centerY);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.top.equalTo(self.mas_top).offset([[UIApplication sharedApplication] statusBarFrame].size.height+10);
    }];
}

#pragma mark - get&set
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.backgroundColor = [UIColor clearColor];
        [_leftBtn setImage:[UIImage imageNamed:@"common_set"] forState:UIControlStateNormal];
    }
    return _leftBtn;
}
- (UIButton *)titleBtn {
    if (!_titleBtn) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleBtn.backgroundColor = [UIColor clearColor];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.selectIcon.size.width, 0, self.selectIcon.size.width)];
        [_titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_titleBtn setTitle:@"2018赛季" forState:UIControlStateNormal];
        [_titleBtn setImage:self.selectIcon forState:UIControlStateNormal];
        [_titleBtn.titleLabel sizeToFit];
        [_titleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, _titleBtn.titleLabel.bounds.size.width, 0, -_titleBtn.titleLabel.bounds.size.width)];
    }
    return _titleBtn;
}
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.backgroundColor = [UIColor clearColor];
        [_rightBtn setImage:[UIImage imageNamed:@"common_pk"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}
- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [[UIImageView alloc] init];
        _bgView.image = [UIImage imageNamed:@"common_navibar"];
    }
    return _bgView;
}
- (UIImage *)selectIcon {
    if (!_selectIcon) {
        _selectIcon = [UIImage imageNamed:@"common_sel"];
    }
    return _selectIcon;
}
- (void)setTitle:(NSString *)title withSelectIcon:(BOOL)select {
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
    if (select) {
        [self.titleBtn setImage:self.selectIcon forState:UIControlStateNormal];
        [self.titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.selectIcon.size.width, 0, self.selectIcon.size.width)];
        [self.titleBtn.titleLabel sizeToFit];
        [self.titleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleBtn.titleLabel.bounds.size.width, 0, -self.titleBtn.titleLabel.bounds.size.width)];
    }else{
        [self.titleBtn setImage:nil forState:UIControlStateNormal];
        [self.titleBtn setImageEdgeInsets:UIEdgeInsetsZero];
        [self.titleBtn setTitleEdgeInsets:UIEdgeInsetsZero];
    }
}
@end
