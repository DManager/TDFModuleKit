//
//  TDFAModule.m
//  TDFModuleKit_Example
//
//  Created by tripleCC on 2017/10/23.
//  Copyright © 2017年 tripleCC. All rights reserved.
//

#import "TDFAModule.h"

@implementation TDFAModule
+ (void)load {
    [self registerModule];
}

+ (TDFModulePriority)priority {
    return TDFModulePriorityHigh;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
