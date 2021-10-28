//
//  LNAccountModule.m
//  LNModuleProtocol_Example
//
//  Created by Lenny on 2021/10/25.
//  Copyright © 2021 dongjianxiong. All rights reserved.
//

#import "LNAccountModule.h"
#import <LNModuleProtocol/LNModuleProtocol.h>
#import <LNModuleCore/LNModuleCore.h>

NSString * const LNAccountLoginSucceedNotification = @"kLNAccountLoginSucceedNotification";
NSString * const LNAccountLogoutFinishNotification = @"kLNAccountLogoutFinishNotification";

// 注册protocol 和 imp class 名称
__attribute__((constructor)) void addModulAccountModule(void){
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[LNModuleManager sharedInstance] addImpClassName:@"LNAccountModule" protocolName:@"LNAccountModuleProtocol"];
    });
}

@interface LNAccountModule ()<LNAccountModuleProtocol>

@end

@implementation LNAccountModule


#pragma mark - LNAccountModuleProtocol

- (void)doInitialize {
    NSLog(@"Invoke method:%s",__func__);
}

- (NSString *)version {
    return @"0.1.2";
}

- (void)getAccountInfo:(LNLoginCompletion)completion {
    if (completion) {
        completion([NSDictionary dictionary], nil);
    }
}

- (BOOL)isLogin {
    return NO;
}

- (BOOL)loginIfNeed:(LNLoginCompletion)completion {
    if ([self isLogin]) {
        return YES;
    }else{
        [self _showLoginPage:completion];
        return NO;
    }
}

- (void)logout {
    NSLog(@"Invoke method:%s",__func__);
}

- (void)registerLoginCompletionNotify:(LNLoginCompletion)completion forKey:(NSString *)key {
    
}


- (void)registerLogoutCompletionNotify:(LNLogotCompletion)completion forKey:(NSString *)key {
    
}


- (void)removeLoginNotificationForKey:(NSString *)key {
    
}


- (void)removeLogoutNotificationForKey:(NSString *)key {
    
}



#pragma mark - 私有方法
/**
 * 展示登录页面
 */
- (void)_showLoginPage:(LNLoginCompletion)completion
{
    UIViewController *loginVc = [[UIViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:loginVc animated:YES completion:nil];
}


@end
