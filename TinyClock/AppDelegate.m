//
//  AppDelegate.m
//  TinyClock
//
//  Created by 龚伟强 on 2020/2/25.
//  Copyright © 2020 龚伟强. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    HomeViewController *vc = [HomeViewController new];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];

    return YES;
}





@end
