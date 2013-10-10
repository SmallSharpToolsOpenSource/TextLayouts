//
//  TabBarViewController.m
//  TextLayouts
//
//  Created by Brennan Stehling on 10/10/13.
//  Copyright (c) 2013 SmallSharpTools LLC. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *selectedIcon = [self selectedTabBarIcon];
    UIImage *unselectedIcon = [self unselectedTabBarIcon];
    
    for (UITabBarItem *item in self.tabBar.items) {
        item.image = unselectedIcon;
        item.selectedImage = selectedIcon;
    }
}

- (UIImage *)selectedTabBarIcon {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0.0f);
        
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(1, 1, 28, 28)];
        [[[UIColor whiteColor] colorWithAlphaComponent:0.4] setFill];
        [ovalPath fill];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    });
    return image;
}

- (UIImage *)unselectedTabBarIcon {
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(30, 30), NO, 0.0f);
        
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(1, 1, 28, 28)];
        [[[UIColor whiteColor] colorWithAlphaComponent:0.3] setFill];
        [ovalPath fill];
        
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    });
    return image;
}

@end
