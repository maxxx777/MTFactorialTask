//
//  MTFactorialCalculatorIOInterface.h
//  MTFactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MTFactorialCalculatorInputInterface <NSObject>

- (void)calculateFactorialRecordsWithLimit:(NSNumber *)limit;

@end

@protocol MTFactorialCalculatorOutputInterface <NSObject>

- (void)onDidCalculateFactorialRecord:(NSString *)record;

@end
