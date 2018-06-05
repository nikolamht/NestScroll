//
//  MyTeamPlayerCellTableViewCell.m
//  
//
//  Created by miaoht on 2018/4/9.
//  Copyright © 2018年 . All rights reserved.
//

#import "MyTeamPlayerCellTableViewCell.h"


@interface MyTeamPlayerCellTableViewCell ()
@property(nonatomic , strong)UIImageView *avatarView;
@property(nonatomic , strong)UILabel *nameLabel;
@property(nonatomic , strong)UILabel *numLabel;
@property(nonatomic , strong)UILabel *sceneLabel;
@property(nonatomic , strong)UILabel *goalLabel;
@property(nonatomic , strong)UILabel *attackLabel;
@end

@implementation MyTeamPlayerCellTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) { return nil; }
    self.backgroundColor = [UIColor getColorFromHex:@"#21282D"];
    [self.contentView addSubview:self.avatarView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numLabel];
    [self.contentView addSubview:self.sceneLabel];
    [self.contentView addSubview:self.attackLabel];
    [self layoutMain];
    return self;
}
- (void)layoutMain {
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@(30));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.leading.equalTo(self.avatarView.mas_trailing).with.offset(8);
        make.width.greaterThanOrEqualTo(@80);
    }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-10));
        make.leading.equalTo(self.nameLabel);
    }];
    [self.sceneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_centerX).offset(20);
    }];
    [self.attackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_right).offset(-25);
    }];
}
#pragma mark - get&set
- (void)setPlayer:(PlayerModel *)player {
    _player = player;
//    [_avatarView setImageWithURL:[NSURL URLWithString:_player.playerLogo]];
//    _nameLabel.text = _player.playerName;
//    _numLabel.text = _player.number;
//    _sceneLabel.text = _player.lastMatch;
//    _goalLabel.text = _player.goal;
//    _attackLabel.text = _player.assists;
}
- (UIImageView *)avatarView {
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
        _avatarView.backgroundColor = [UIColor whiteColor];
        _avatarView.layer.cornerRadius = 15;
        _avatarView.layer.masksToBounds = YES;
    }
    return _avatarView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}
- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]init];
        _numLabel.font = [UIFont systemFontOfSize:10];
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.alpha = 0.5;
    }
    return _numLabel;
}
- (UILabel *)attackLabel {
    if (!_attackLabel) {
        _attackLabel = [[UILabel alloc] init];
        _attackLabel.font = [UIFont systemFontOfSize:12];
        _attackLabel.textColor = [UIColor whiteColor];
        _attackLabel.textAlignment = NSTextAlignmentLeft;
        _attackLabel.text = @"0";
    }
    return _attackLabel;
}
- (UILabel *)goalLabel {
    if (_goalLabel) {return _goalLabel;}
    _goalLabel = [[UILabel alloc] init];
    _goalLabel.font = [UIFont systemFontOfSize:12];
    _goalLabel.textColor = [UIColor whiteColor];
    _goalLabel.textAlignment = NSTextAlignmentLeft;
    _goalLabel.text = @"5";
    [self.contentView addSubview:_goalLabel];
    [_goalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];
    return _goalLabel;
}
- (UILabel *)sceneLabel {
    if (!_sceneLabel) {
        _sceneLabel = [[UILabel alloc] init];
        _sceneLabel.font = [UIFont systemFontOfSize:12];
        _sceneLabel.textColor = [UIColor whiteColor];
        _sceneLabel.textAlignment = NSTextAlignmentLeft;
        _sceneLabel.text = @"内容";
    }
    return _sceneLabel;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.goalLabel.superview) {
        [self.goalLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.centerX.equalTo(self.contentView.mas_centerX).offset(self.contentView.bounds.size.width/4);
        }];
    }
}
@end
