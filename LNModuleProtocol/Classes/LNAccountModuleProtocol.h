//
//  LNLoginModuleProtocol.h
//  LNModuleProtocol
//
//  Created by Lenny on 2021/10/17.
//

#import <Foundation/Foundation.h>
#import "LNModuleProtocol.h"


extern NSString * const LNAccountLoginSucceedNotification;
extern NSString * const LNAccountLogoutFinishNotification;

typedef void(^LNLoginCompletion)(NSDictionary *accountInfo, NSString * errMsg);


@protocol LNAccountModuleProtocol <LNModuleBaseProtocol>

- (BOOL)isLogin;

- (BOOL)loginIfNeed:(LNLoginCompletion)completion;

- (void)logout;

- (void)getAccountInfo:(LNLoginCompletion)completion;

@end
