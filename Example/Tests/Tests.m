//
//  TDFModuleKitTests.m
//  TDFModuleKitTests
//
//  Created by tripleCC on 10/23/2017.
//  Copyright (c) 2017 tripleCC. All rights reserved.
//
@import UIKit;
@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testExample
{
    
}

- (void)test_boolReturnValue {
    XCTAssertTrue([[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ggboy"] options:@{}]);
    XCTAssertFalse([[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"ftp://ggboy"] options:@{}]);
    XCTAssertFalse([[UIApplication sharedApplication].delegate application:[UIApplication sharedApplication] shouldAllowExtensionPointIdentifier:@"LALALA"]);
}

@end

