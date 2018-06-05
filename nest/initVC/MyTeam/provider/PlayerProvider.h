//
//  PlayerProvider.h
//  ApocalypseiOS
//
//  Created by miaoht on 2018/4/9.
//  Copyright © 2018年 SuningSports. All rights reserved.
//

#import "SNSRequest.h"

@interface PlayerProvider : SNSRequest
+ (void)getPlayerWithCompetitionId:(NSString *)competitionId
                          seasonId:(NSString *)seasonId
                            teamId:(NSString *)teamId
                           success:(void(^)(PlayerProvider *request))sucBlock
                           failure:(void(^)(SNSRequest *request))failBlock
                          animated:(BOOL)animated
                       loadingText:(NSString*)loadingText
                            inView:(UIView*)containerView;
@end
