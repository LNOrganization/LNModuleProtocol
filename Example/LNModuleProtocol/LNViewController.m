//
//  LNViewController.m
//  LNModuleProtocol
//
//  Created by dongjianxiong on 10/20/2021.
//  Copyright (c) 2021 dongjianxiong. All rights reserved.
//

#import "LNViewController.h"
#import "LNModuleProtocol.h"
#import <LNModuleCore/LNModuleCore.h>

@interface LNViewController ()

@end

@implementation LNViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_logoutAction:) name:LNAccountLogoutFinishNotification object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    id<LNFeedModuleProtocol> feedModule = (id)[[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNFeedModuleProtocol)];
    if (feedModule) {
        UIViewController *feedVc = [feedModule getRecommendFeedViewController];
        [self presentViewController:feedVc animated:YES completion:nil];
    }
    
    id<LNAccountModuleProtocol> loginModule = (id)[[LNModuleManager sharedInstance] impInstanceForProtocol:@protocol(LNAccountModuleProtocol)];
    [loginModule loginIfNeed:^(NSDictionary *accountInfo, NSString *errMsg) {
        
    }];
}


#pragma mark - notification
//登出通知方法
- (void)_logoutAction:(NSNotification *)notification
{
    NSLog(@"Did logout");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
