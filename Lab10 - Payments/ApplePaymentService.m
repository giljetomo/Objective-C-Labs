//
//  ApplePaymentService.m
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService
- (void)processPaymentAmount:(float)amount {
  NSLog(@"ApplePay processed an amount of $%.2f", amount);
}

- (BOOL)canProcessPayment {
  return arc4random_uniform(2);
}

- (NSString *)description
{
  return @"ApplePay";
}
@end
