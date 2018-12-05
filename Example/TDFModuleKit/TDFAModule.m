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
    [self runAfterMethodExecuted:^{
        NSLog(@"runAfterMethodExecuted %@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }];
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

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return NO;
}

- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    
    return NO;
}

@end
