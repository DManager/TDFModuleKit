//
//  TDFModule.h
//  Aspects
//
//  Created by tripleCC on 2017/10/23.
//
@import UIKit;

@protocol TDFModuleProtocol <UIApplicationDelegate>
@end

typedef NS_ENUM(NSInteger, TDFModuleRegisterPriority) {
    TDFModuleRegisterPriorityVeryLow = 0,
    TDFModuleRegisterPriorityLow = 1,
    TDFModuleRegisterPriorityMedium = 2,
    TDFModuleRegisterPriorityHigh = 3,
    TDFModuleRegisterPriorityVeryHigh = 4,
};

@interface TDFModule : NSObject <TDFModuleProtocol>
+ (instancetype)module;
+ (void)registerModule;
+ (TDFModuleRegisterPriority)priority;
@end
