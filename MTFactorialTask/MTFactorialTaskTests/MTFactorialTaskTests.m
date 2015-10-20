//
//  MTFactorialTaskTests.m
//  MTFactorialTaskTests
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MTFactorialCalculator.h"

@interface MTFactorialTaskTests : XCTestCase
<
MTFactorialCalculatorOutputInterface
>
{
    MTFactorialCalculator *factorialCalculator;
    XCTestExpectation *expectation;
    NSInteger initialCount;
    NSInteger count;
}

@end

@implementation MTFactorialTaskTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    factorialCalculator = [[MTFactorialCalculator alloc] init];
    factorialCalculator.output = self;
    
    count = 0;
    initialCount = count;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    count = 0;
    initialCount = count;
    
    factorialCalculator = nil;
    
    [super tearDown];
}

- (void)testWhenLimitIsEqualTo0 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 0;
    
    //    [self tryToTestWhenLimitIsEqualTo:@0];
    //
    //    [expectation fulfill];
}

- (void)testWhenLimitIsEqualTo1 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 1;
    
    [self tryToTestWhenLimitIsEqualTo:@1];
}

- (void)testWhenLimitIsEqualTo2 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 2;
    
    [self tryToTestWhenLimitIsEqualTo:@2];
}

- (void)testWhenLimitIsEqualTo3 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 2;
    
    [self tryToTestWhenLimitIsEqualTo:@3];
}

- (void)testWhenLimitIsEqualTo5 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 2;
    
    [self tryToTestWhenLimitIsEqualTo:@5];
}

- (void)testWhenLimitIsEqualTo7 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 3;
    
    [self tryToTestWhenLimitIsEqualTo:@7];
}

- (void)testWhenLimitIsEqualTo23 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 3;
    
    [self tryToTestWhenLimitIsEqualTo:@23];
}

- (void)testWhenLimitIsEqualTo24 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 4;
    
    [self tryToTestWhenLimitIsEqualTo:@24];
}

- (void)testWhenLimitIsEqualTo1000 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 6;
    
    [self tryToTestWhenLimitIsEqualTo:@1000];
}

- (void)testWhenLimitIsEqualTo3456 {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    count = 6;
    
    [self tryToTestWhenLimitIsEqualTo:@3456];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark - MTFactorialCalculatorOutputInterface

- (void)onDidCalculateFactorialRecord:(NSString *)record
{
    if (count > 0) {
        
        XCTAssertEqualObjects([[self recordStrings] objectAtIndex:initialCount - count], record);
        
        count--;
        
        if (count == 0) {
            [expectation fulfill];
        }
        
    } else {
        
        XCTAssertFalse(@"There is redundant callback");
        
    }
}

#pragma mark - Helper

- (void)tryToTestWhenLimitIsEqualTo:(NSNumber *)limit
{
    initialCount = count;
    
    expectation = [self expectationWithDescription:@"calculate numbers in background"];
    
    [factorialCalculator calculateFactorialRecordsWithLimit:limit];
    
    [self waitForExpectationsWithTimeout:0.001
                                 handler:nil];
}

- (NSArray *)recordStrings
{
    return @[
             @"1 (1! = 1)",
             @"2 (2! = 2)",
             @"3 (3! = 6)",
             @"4 (4! = 24)",
             @"5 (5! = 120)",
             @"6 (6! = 720)"
             ];
}

@end
