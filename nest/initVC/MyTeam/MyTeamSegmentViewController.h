//
//  MyTeamSegmentViewController.h
//  
//
//  Created by miaoht on 2018/4/11.
//  Copyright © 2018年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTeamScrollerDelegate.h"
@interface MyTeamSegmentViewController : UIViewController
@property(nonatomic , strong)NSMutableArray<UIViewController *> *viewControllers;
/**
 设置到指定页面
 */
@property(nonatomic , assign)NSUInteger pageIndex;
@property(nonatomic , weak)id<MyTeamScrollerDelegate> delegate;
@end
