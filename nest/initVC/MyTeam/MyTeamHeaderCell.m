//
//  MyTeamHeaderCell.m
//  
//
//  Created by miaoht on 2018/4/9.
//  Copyright © 2018年 . All rights reserved.
//

#import "MyTeamHeaderCell.h"
#import <Masonry.h>
#import "UIColor+HexColor.h"
@interface MyTeamHeaderCell ()
@property(nonatomic , strong)UILabel *actorLabel;
@property(nonatomic , strong)UILabel *sceneLabel;
@property(nonatomic , strong)UILabel *goalLabel;
@property(nonatomic , strong)UILabel *attackLabel;
@end

@implementation MyTeamHeaderCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (!self) {return nil;}
    self.contentView.backgroundColor = [UIColor getColorFromHex:@"#1E2024"];
    [self.contentView addSubview:self.actorLabel];
    [self.contentView addSubview:self.sceneLabel];
    [self.contentView addSubview:self.goalLabel];
    [self.contentView addSubview:self.attackLabel];
    [self layoutMain];
    return self;
}
- (void)layoutMain {
    [self.actorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(15);
    }];
    [self.sceneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_centerX).offset(20);
    }];
    [self.goalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];
    [self.attackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_right).offset(-25);
    }];
}
#pragma make - get&set
- (void)setPlayer:(PlayerModel *)player {
    _player = player;
//    _actorLabel.text = player.position;
}
- (UILabel *)attackLabel {
    if (!_attackLabel) {
        _attackLabel = [[UILabel alloc] init];
        _attackLabel.font = [UIFont systemFontOfSize:12];
        _attackLabel.textColor = [UIColor getColorFromHex:@"#7C93A7"];
        _attackLabel.textAlignment = NSTextAlignmentLeft;
        _attackLabel.text = @"内容";
    }
    return _attackLabel;
}
- (UILabel *)goalLabel {
    if (!_goalLabel) {
        _goalLabel = [[UILabel alloc] init];
        _goalLabel.font = [UIFont systemFontOfSize:12];
        _goalLabel.textColor = [UIColor getColorFromHex:@"#7C93A7"];
        _goalLabel.textAlignment = NSTextAlignmentLeft;
        _goalLabel.text = @"内容";
    }
    return _goalLabel;
}
- (UILabel *)sceneLabel {
    if (!_sceneLabel) {
        _sceneLabel = [[UILabel alloc] init];
        _sceneLabel.font = [UIFont systemFontOfSize:12];
        _sceneLabel.textColor = [UIColor getColorFromHex:@"#7C93A7"];
        _sceneLabel.textAlignment = NSTextAlignmentLeft;
        _sceneLabel.text = @"内容";
    }
    return _sceneLabel;
}
- (UILabel *)actorLabel {
    if (!_actorLabel) {
        _actorLabel = [[UILabel alloc] init];
        _actorLabel.font = [UIFont systemFontOfSize:12];
        _actorLabel.textColor = [UIColor getColorFromHex:@"#7C93A7"];
        _actorLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _actorLabel;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self goalLabel];
    [_goalLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView.mas_centerX).offset(self.contentView.bounds.size.width/4);
    }];
}
@end
