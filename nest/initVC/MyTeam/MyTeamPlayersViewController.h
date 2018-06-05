//
//  MyTeamPlayersViewController.h
//  
//
//  Created by miaoht on 2018/4/11.
//  Copyright © 2018年 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTeamScrollerDelegate.h"
#import "MyTeamContainerViewDelegate.h"
@interface MyTeamPlayersViewController : UIViewController
@property(nonatomic , weak)id<MyTeamScrollerDelegate> delegate;
@property(nonatomic , weak)id<MyTeamContainerViewDelegate> containerDelegate;
@end
