//
//  MyTeamScrollerDelegate.h
//  
//
//  Created by miaoht on 2018/4/11.
//  Copyright © 2018年 . All rights reserved.
//
@protocol MyTeamScrollerDelegate <NSObject>
@required
- (void)myteamscrollViewWillBeginDragging:(UIScrollView *)scrollView beginDraggingY:(CGFloat)draggingY beginDirection:(CGFloat)direction;
- (void)myteamScrollViewDidScroll:(UIScrollView *)scrollView beginDraggingY:(CGFloat)draggingY beginDirection:(CGFloat)direction;
- (void)myteamscrollViewDidEndDragging:(UIScrollView *)scrollView beginDraggingY:(CGFloat)draggingY;
@end
