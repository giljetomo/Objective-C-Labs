//
//  AmazonPaymentService.m
//  Lab10 - Payments
//
//  Created by Gil Jetomo on 2021-03-03.
//

#import "AmazonPaymentService.h"

@implementation AmazonPaymentService

- (void)processPaymentAmount:(float)amount {
  NSLog(@"Amazon processed an amount of $%.2f", amount);
}

- (BOOL)canProcessPayment {
  return arc4random_uniform(2);
}

- (NSString *)description
{
  return @"Amazon";
}
@end
