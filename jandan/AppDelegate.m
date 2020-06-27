//
//  AppDelegate.m
//  jandan
//
//  Created by 代烁 on 2020/6/26.
//  Copyright © 2020 代烁. All rights reserved.
//

#import "AppDelegate.h"
#import "ReadilyViewController.h"
#import "BoringPictureViewController.h"
#import "NewsViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIScreen *uiScreen = [UIScreen mainScreen];
    self.window = [[UIWindow alloc]initWithFrame: [uiScreen bounds]];
    
    NewsViewController *newsViewController = [[NewsViewController alloc]init];
    newsViewController.tabBarItem.title = @"新鲜事";
    
    
    BoringPictureViewController *boringPictureViewController = [[BoringPictureViewController alloc]init];
    boringPictureViewController.tabBarItem.title = @"无聊图";
    
    ReadilyViewController *readilyViewController = [[ReadilyViewController alloc]init];
    readilyViewController.tabBarItem.title = @"随手拍";
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    [tabBarController setViewControllers:@[newsViewController,boringPictureViewController,readilyViewController]];
    

    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tabBarController];
    

    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
