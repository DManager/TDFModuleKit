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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
