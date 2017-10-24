//
//  TDFModule.m
//  Aspects
//
//  Created by tripleCC on 2017/10/23.
//

#import "TDFModule.h"
#import "TDFModuleManager.h"

@implementation TDFModule
- (instancetype)init {
    if (self = [super init]) {
        if (![self conformsToProtocol:@protocol(TDFModuleProtocol)]) {
            @throw [NSException exceptionWithName:@"TDFModuleRegisterProgress" reason:@"subclass should confirm to <TDFModuleProtocol>." userInfo:nil];
        }
    }
    
    return self;
}

+ (instancetype)module {
    return [[self alloc] init];
}

+ (void)registerModule {
    [TDFModuleManager addModuleClass:self];
}

+ (TDFModulePriority)priority {
    return TDFModulePriorityMedium;
}
@end
