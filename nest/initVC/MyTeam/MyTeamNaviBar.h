//
//  MyTeamNaviBar.h
//  
//
//  Created by miaoht on 2018/4/8.
//  Copyright © 2018年 . All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTeamNaviBar : UIView
@property(nonatomic , strong)UIButton *leftBtn;
/**
 @param title 设置titile
 @param select yes显示下拉箭头 no不显示
 */
- (void)setTitle:(NSString *)title withSelectIcon:(BOOL)select;
@end
