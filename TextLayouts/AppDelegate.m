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
    [[UINavigationBar appearance] setBarTintColor:[UIColor cyanColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor cyanColor]];
    
    self.window.tintColor = [UIColor blackColor];
    
    return YES;
}

@end
