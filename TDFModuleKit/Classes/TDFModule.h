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

 - TDFModulePriorityVeryLow: 极底
 - TDFModulePriorityLow: 低
 安排给弱业务，业务模块
 
 - TDFModulePriorityMedium: 中
 - TDFModulePriorityHigh: 高
 - TDFModulePriorityVeryHigh: 极高
 安排给基础模块（有些基础模块每次依赖都需要手动调用初始化方法，建议分成 Core / Initializer subspec，后者中只有一个类继承TDFModule，这样直接依赖模块时，初始化代码的编写就可以去掉了）
 这种情况下，TDFModule子类中，最好不要存在硬编码，使用变量或配置文件配置，这样才能让各业务线通用
 */
typedef NS_ENUM(NSInteger, TDFModulePriority) {
    TDFModulePriorityVeryLow = 0,
    TDFModulePriorityLow = 1,
    TDFModulePriorityMedium = 2,
    TDFModulePriorityHigh = 3,
    TDFModulePriorityVeryHigh = 4,
};

@interface TDFModule : NSObject 
+ (instancetype)module;

/**
 在 load 中调用，以注册模块
 */
+ (void)registerModule;

/**
 模块优先级
 
 主工程模块的调用最先进行，剩余附属模块，
 内部会根据优先级，依次调用 UIApplicationDelegate 代理
 默认是 TDFModulePriorityMedium
 
 @return 优先级
 */
+ (TDFModulePriority)priority;
@end
