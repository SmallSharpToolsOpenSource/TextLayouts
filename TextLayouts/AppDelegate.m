//
//  AppDelegate.m
//  TextLayouts
//
//  Created by Brennan Stehling on 10/10/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIColor *darkCyan = [UIColor colorWithRed:0.00 green:0.54 blue:0.54 alpha:1.0];
    UIColor *darkerCyan = [UIColor colorWithRed:0.04 green:0.34 blue:0.43 alpha:1.0];
    
    [[UINavigationBar appearance] setBarTintColor:darkCyan];
    [[UITabBar appearance] setBarTintColor:darkCyan];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : darkerCyan } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : darkerCyan } forState:UIControlStateSelected];
    
    self.window.tintColor = [UIColor blackColor];
    
    return YES;
}

@end
