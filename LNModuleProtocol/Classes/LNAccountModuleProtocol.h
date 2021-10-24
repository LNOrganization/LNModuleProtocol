//
//  LNLoginModuleProtocol.h
//  LNModuleProtocol
//
//  Created by Lenny on 2021/10/17.
//

#import <Foundation/Foundation.h>
#import "LNModuleProtocol.h"


extern const NSString *LNAccountLoginSucceedNotification;
extern const NSString *LNAccountLoginSucceedNotification;

typedef void(^LNLoginCompletion)(NSDictionary *accountInfo, NSString * errMsg);


@protocol LNAccountModuleProtocol <LNModuleBaseProtocol>

- (BOOL)isLogin;

- (BOOL)login:(LNLoginCompletion)completion;

- (void)logout:(LNLoginCompletion)completion;;

- (void)registerLoginCompletionNotify:(LNLoginCompletion)completion;

- (void)registerLogoutCompletionNotify:(LNLoginCompletion)completion;


@end
