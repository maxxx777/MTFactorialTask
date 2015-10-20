//
//  MTFactorialCalculator.h
//  MTFactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTFactorialCalculatorIOInterface.h"

@interface MTFactorialCalculator : NSObject
<
    MTFactorialCalculatorInputInterface
>

@property (nonatomic, weak) id<MTFactorialCalculatorOutputInterface>output;

@end
