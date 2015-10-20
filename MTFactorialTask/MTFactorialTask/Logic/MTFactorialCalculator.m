//
//  MTFactorialCalculator.m
//  MTFactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import "MTFactorialCalculator.h"

@implementation MTFactorialCalculator

#pragma mark - MTFactorialCalculatorInputInterface

- (void)calculateFactorialRecordsWithLimit:(NSNumber *)limit
{
    __block unsigned long calculationLimit = [limit unsignedLongValue];
    __block unsigned long calculationStartNumber = 2;
    __block unsigned long calculationStartResult = 1;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
        if (calculationLimit > 0) {
            [self calculateWithNumber:calculationStartNumber
                                limit:calculationLimit
                               result:calculationStartResult];
        }
    });
}

#pragma mark - Helper

- (void)calculateWithNumber:(unsigned long)number
                      limit:(const unsigned long)limit
                     result:(unsigned long)result
{
    __block unsigned long numberToDisplay = number;
    __block unsigned long resultToDisplay = result;
    dispatch_sync(dispatch_get_main_queue(), ^{
        if (self.output) {
            NSString *recordString = [NSString stringWithFormat:@"%@ (%@! = %@)", @(numberToDisplay - 1), @(numberToDisplay - 1), @(resultToDisplay)];
            [self.output onDidCalculateFactorialRecord:recordString];
        }
    });

    BOOL isMultiplicationOverFlown = [self isMultiplicationOverFlownUnsignedLongTypeWithMultiplier1:result
                                                                                        multiplier2:number];
    if (!isMultiplicationOverFlown) {
        
        result *= number;
        
        BOOL isLimitExceeded = result > limit;
        if (!isLimitExceeded) {
            
            [self calculateWithNumber:number + 1
                                limit:limit
                               result:result];
        }
    }
}

- (BOOL)isMultiplicationOverFlownUnsignedLongTypeWithMultiplier1:(unsigned long)multiplier1
                                                     multiplier2:(unsigned long)multiplier2
{
    BOOL result = multiplier2 > ULONG_MAX / multiplier1;
//    NSLog(@"%d %lu * %lu", result, multiplier1, multiplier2);
    return result;
}

@end
