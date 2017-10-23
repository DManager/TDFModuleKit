//
//  TDFApplicationDelegateProxy.m
//  Aspects
//
//  Created by tripleCC on 2017/10/23.
//
@import ObjectiveC;
@import UIKit;

#import "TDFModule.h"
#import "TDFModuleManager.h"
#import "TDFApplicationDelegateProxy.h"

@implementation TDFApplicationDelegateProxy
- (Protocol *)targetProtocol {
    return @protocol(UIApplicationDelegate);
}

- (BOOL)isTargetProtocolMethod:(SEL)selector {
    unsigned int outCount = 0;
    struct objc_method_description *methodDescriptions = protocol_copyMethodDescriptionList([self targetProtocol], NO, YES, &outCount);
    
    for (int idx = 0; idx < outCount; idx++) {
        if (selector == methodDescriptions[idx].name) {
            return YES;
        }
    }
    free(methodDescriptions);
    
    return NO;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([self.realDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    
    for (TDFModule *module in [TDFModuleManager shared].modules) {
        if ([self isTargetProtocolMethod:aSelector] && [module respondsToSelector:aSelector]) {
            return YES;
        }
    }
    
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (![self isTargetProtocolMethod:aSelector] && [self.realDelegate respondsToSelector:aSelector]) {
            return self.realDelegate;
    }
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    struct objc_method_description methodDescription = protocol_getMethodDescription([self targetProtocol], aSelector, NO, YES);
    
    if (methodDescription.name == NULL && methodDescription.types == NULL) {
        return [[self class] instanceMethodSignatureForSelector:@selector(doNothing)];
    }
    
    return [NSMethodSignature signatureWithObjCTypes:methodDescription.types];;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([self.realDelegate respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self.realDelegate];
    }
    
    for (TDFModule *module in [TDFModuleManager shared].modules) {
        if ([module respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:module];
        }
    }
}

- (void)doNothing {}
@end
