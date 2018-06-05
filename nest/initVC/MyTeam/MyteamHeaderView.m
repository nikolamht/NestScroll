//
//  MyteamHeaderView.m
//  
//
//  Created by miaoht on 2018/4/9.
//  Copyright © 2018年 . All rights reserved.
//

#import "MyteamHeaderView.h"

@interface MyteamHeaderView ()
@property(nonatomic , strong)UIImageView *avatarView;
@property(nonatomic , strong)UILabel *nameLabel;
@property(nonatomic , strong)UILabel *detailLabel;
@property(nonatomic , strong)UIButton *detailBtn;
@end

@implementation MyteamHeaderView
- (instancetype)init {
    self = [super init];
    if (!self) { return nil; }
    self.image = [UIImage imageNamed:@"common_header"];
    self.backgroundColor = [UIColor purpleColor];
    [self addSubview:self.avatarView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.detailBtn];
    [self layoutMain];
    return self;
}
- (void)layoutMain {
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30);
        make.bottom.equalTo(self.mas_bottom).offset(-20);
        make.height.equalTo(@(60));
        make.width.equalTo(@(46));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(15);
        make.top.equalTo(self.avatarView.mas_top).offset(5);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left);
        make.top.equalTo(_nameLabel.mas_bottom).offset(10);
    }];
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avatarView.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
}
#pragma mark - get&set
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.backgroundColor = [UIColor lightGrayColor];
        _avatarView.image = [UIImage imageNamed:@"commom_placeholder"];
    }
    return _avatarView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.text = @"这里是名字";
    }
    return _nameLabel;
}
- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.text = @"昵称";
    }
    return _detailLabel;
}
- (UIButton *)detailBtn {
    if (!_detailBtn) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_detailBtn setImage:[UIImage imageNamed:@"common_detail"] forState:UIControlStateNormal];
    }
    return _detailBtn;
}
@end
