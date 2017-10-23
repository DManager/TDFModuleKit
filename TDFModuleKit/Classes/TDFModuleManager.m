//
//  TDFModuleManager.m
//  Aspects
//
//  Created by tripleCC on 2017/10/23.
//
@import ObjectiveC.objc;
@import ObjectiveC.message;
@import UIKit;

#import "TDFModuleManager.h"
#import "TDFModule.h"
#import "TDFApplicationDelegateProxy.h"

static NSMutableArray const * TDFModuleClassArray = nil;
static NSMutableArray <TDFModule *> const * TDFModuleArray = nil;

@implementation TDFModuleManager
+ (instancetype)shared {
    static dispatch_once_t onceToken;
    static TDFModuleManager *singleton = nil;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

+ (void)addModuleClass:(Class)cls {
    NSParameterAssert(cls && [cls conformsToProtocol:@protocol(TDFModuleProtocol)]);
    if (!TDFModuleClassArray) {
        TDFModuleClassArray = [NSMutableArray array];
    }
    if (![TDFModuleClassArray containsObject:cls]) {
        [TDFModuleClassArray addObject:cls];
    }
}

+ (void)removeModuleClass:(Class)cls {
    [TDFModuleClassArray removeObject:cls];
}

+ (void)generateRegistedModules {
    if (!TDFModuleArray) {
        TDFModuleArray = [NSMutableArray array];
    }
    
    [TDFModuleClassArray sortUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO]]];
    
    for (Class cls in TDFModuleClassArray) {
        TDFModule *module = [cls module];
        NSAssert(module, @"module can't be nil of class %@", NSStringFromClass(cls));
        if (![TDFModuleArray containsObject:module]) {
            [TDFModuleArray addObject:module];
        }
    }
}

- (TDFApplicationDelegateProxy *)proxy {
    if (!_proxy) {
        _proxy = [[TDFApplicationDelegateProxy alloc] init];
    }
    
    return _proxy;
}

- (NSArray<TDFModule *> *)modules {
    return (NSArray<TDFModule *> *)TDFModuleArray;
}
@end

static void MCDSwizzleInstanceMethod(Class cls, SEL originalSelector, Class targetCls, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(targetCls, swizzledSelector);
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIApplication (TDFModule)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MCDSwizzleInstanceMethod(self, @selector(setDelegate:), self, @selector(mcd_setDelegate:));
    });
}

- (void)mcd_setDelegate:(id <UIApplicationDelegate>)delegate {
    TDFModuleManager.shared.proxy.realDelegate = delegate;
    [TDFModuleManager generateRegistedModules];
    
    [self mcd_setDelegate:(id <UIApplicationDelegate>)TDFModuleManager.shared.proxy];
}
@end
