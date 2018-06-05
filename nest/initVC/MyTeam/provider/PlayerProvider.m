//
//  PlayerProvider.m
//  ApocalypseiOS
//
//  Created by miaoht on 2018/4/9.
//  Copyright © 2018年 SuningSports. All rights reserved.
//

#import "PlayerProvider.h"

@implementation PlayerProvider
+ (void)getPlayerWithCompetitionId:(NSString *)competitionId
                          seasonId:(NSString *)seasonId
                            teamId:(NSString *)teamId
                       success:(void(^)(PlayerProvider *request))sucBlock
                       failure:(void(^)(SNSRequest *request))failBlock
                      animated:(BOOL)animated
                   loadingText:(NSString*)loadingText
                        inView:(UIView*)containerView
{
    MBProgressHUD *hub;
    if (animated) {
        hub = [MBProgressHUD showHUDAddedTo:containerView animated:YES];
        hub.mode = MBProgressHUDModeIndeterminate;
    }
    APIPackagePlayersGoHeader *goHead = [[APIPackagePlayersGoHeader alloc]init];
    goHead.competitionId = competitionId;
    goHead.seasonId = seasonId;
    goHead.teamId = teamId;
    [goHead makeDictionary];
    PlayerProvider *req = [[PlayerProvider alloc] initWithDicGo:goHead.dicGo
                                                     requestUrl:@"mobile/myTeamPlayer.do"
                                                  requestMethod:YTKRequestMethodPOST];
    [req startWithCompletionBlockWithSuccess:^(__kindof PlayerProvider * _Nonnull request) {
        [hub hideAnimated:YES];
        if (request.code == 0) {
            if (sucBlock) {
                sucBlock(request);
            }
        }
        else
        {
            if (failBlock) {
                failBlock(request);
            }
        }
    } failure:^(__kindof SNSRequest * _Nonnull request) {
        [hub hideAnimated:YES];
        if (failBlock) {
            failBlock(request);
        }
    }];
}

-(void)requestCompleteFilter
{
    [super requestCompleteFilter];
    if (self.code != 0) {
        self.result = nil;
        return;
    }
}
@end
