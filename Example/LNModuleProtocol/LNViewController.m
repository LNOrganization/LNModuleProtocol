//
//  LNViewController.m
//  LNModuleProtocol
//
//  Created by dongjianxiong on 10/20/2021.
//  Copyright (c) 2021 dongjianxiong. All rights reserved.
//

#import "LNViewController.h"
#import "LNFeedModuleProtocol.h"

@interface LNViewController ()

@end

@implementation LNViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
