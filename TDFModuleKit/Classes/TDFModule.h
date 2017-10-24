//
//  TDFModule.h
//  Aspects
//
//  Created by tripleCC on 2017/10/23.
//
@import UIKit;


/**
 模块子类必须遵守此协议
 */
@protocol TDFModuleProtocol <UIApplicationDelegate>
@end

/**
 模块优先级

 - TDFModuleRegisterPriorityVeryLow: 极底
 - TDFModuleRegisterPriorityLow: 低
 - TDFModuleRegisterPriorityMedium: 中
 - TDFModuleRegisterPriorityHigh: 高
 - TDFModuleRegisterPriorityVeryHigh: 极高
 */
typedef NS_ENUM(NSInteger, TDFModuleRegisterPriority) {
    TDFModuleRegisterPriorityVeryLow = 0,
    TDFModuleRegisterPriorityLow = 1,
    TDFModuleRegisterPriorityMedium = 2,
    TDFModuleRegisterPriorityHigh = 3,
    TDFModuleRegisterPriorityVeryHigh = 4,
};

@interface TDFModule : NSObject 
+ (instancetype)module;

/**
 在 load 中调用，以注册模块
 */
+ (void)registerModule;

/**
 模块优先级
 
 内部会根据优先级，依次调用 UIApplicationDelegate 代理
 默认是 TDFModuleRegisterPriorityMedium
 
 @return 优先级
 */
+ (TDFModuleRegisterPriority)priority;
@end
