//
//  AppDelegate.m
//  maruko
//
//  Created by 王澍宇 on 16/2/21.
//  Copyright © 2016年 Shuyu. All rights reserved.
//

#import <AFNetworking.h>

#import "AppDelegate.h"

#import "FDTabBarController.h"
#import "FDWelcomeViewController.h"
#import "FDFeedsViewController.h"

#import "FDAccountService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    FDFeedsViewController *feedsViewController = [[FDFeedsViewController alloc] init];
    feedsViewController.viewModel = [[FDFeedsViewModel alloc] initWithAPI:@"star/news"];
    
    FDNavigationController *feedsNavigationController = [[FDNavigationController alloc] initWithRootViewController:feedsViewController];
    
    FDBaseViewController *dayViewController = [[FDBaseViewController alloc] init];
    
    FDNavigationController *dayNavigationController = [[FDNavigationController alloc] initWithRootViewController:dayViewController];
    
    FDBaseViewController *findViewController = [[FDBaseViewController alloc] init];
    
    FDNavigationController *findNavigationController = [[FDNavigationController alloc] initWithRootViewController:findViewController];
    
    FDBaseViewController *followViewController = [[FDBaseViewController alloc] init];
    
    FDNavigationController *followNavigationController = [[FDNavigationController alloc] initWithRootViewController:followViewController];
    
    FDBaseViewController *userViewController = [[FDBaseViewController alloc] init];
    
    FDNavigationController *userNavigationController = [[FDNavigationController alloc] initWithRootViewController:userViewController];
    
    FDTabBarController *tabBarController = [[FDTabBarController alloc] initWithViewControllers:@[feedsNavigationController,
                                                                                                 dayNavigationController,
                                                                                                 findNavigationController,
                                                                                                 followNavigationController,
                                                                                                 userNavigationController]
                                                                                        Titles:@[@"动态", @"行程", @"发现", @"关注", @"我的"]
                                                                                        Images:@[FDImageWithName(@"Tab_Feeds"),
                                                                                                 FDImageWithName(@"Tab_Day"),
                                                                                                 FDImageWithName(@"Tab_Find"),
                                                                                                 FDImageWithName(@"Tab_Follow"),
                                                                                                 FDImageWithName(@"Tab_Me")]
                                                                                SelectedImages:@[FDImageWithName(@"Tab_Feeds_Selected"),
                                                                                                 FDImageWithName(@"Tab_Day_Selected"),
                                                                                                 FDImageWithName(@"Tab_Find_Selected"),
                                                                                                 FDImageWithName(@"Tab_Follow_Selected"),
                                                                                                 FDImageWithName(@"Tab_Me_Selected")]];
    tabBarController.tabBar.alpha = 0.95;
    
    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarTintColor:ColorNormalBGWhite];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : ColorNormalNaviTitle}];
    
    if ([FDAccountService checkIfNeedLogin]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIWindow presentViewController:[FDWelcomeViewController new] Animated:YES Completion:nil];
        });
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
