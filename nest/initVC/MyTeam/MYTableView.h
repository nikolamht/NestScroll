//
//  MYTableView.h
//  
//
//  Created by miaoht on 2018/4/21.
//  Copyright © 2018年 . All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_OPTIONS(NSUInteger, MYTableViewDirection) {
//    MYTableViewDirectionUnknow = 1 << 0,
//    MYTableViewDirectionUp     = 1 << 1,
//    MYTableViewDirectionDown   = 1 << 2,
//};

@interface MYTableView : UITableView
@property(nonatomic , assign) CGFloat velocity;
@property(nonatomic , assign) CGFloat lastTranslationPointInView;
@property(nonatomic , assign) CGFloat lastTranslationInView;
@property(nonatomic , assign) CGFloat headerOffset;
@property(nonatomic , assign) CGFloat beginDragingY;
@end
